Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D701272
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 19:11:25 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MTikV-1luSXs2TKn-00U3Ih; Sat, 15 May 2021 21:11:21 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 14/20] staging: vchiq_core: reduce indention in release_service_messages
Date: Sat, 15 May 2021 21:10:53 +0200
Message-Id: <1621105859-30215-15-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:0WY/fuzMta+IZqGSWyVPRJySEMyug/HPpfZwEdDvXYI87FORKGk
 uRRVD19m8m/MZMF6I/TIJxhYD6FGD15zDh/woEsi+VEeqddpSbHj0+zsqyLBEK7YXNFZuWy
 IsgazmHj5Z2RCznqddpwTxgWPPs10PCVmI+dyCkDDDgQfFD5LDkzc7AIFcwT54zs+VL4DSs
 xT+9VTO1UIbbDRVtijpmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4vagtpwIJgc=:t6myT9zdClzZKuH3zmXZwW
 b0lP/oICAbyLOr6HPDnqPj59B4EEztj7AJ1Sxw3iv05o2dMiFYLvey4URuAEwfo1DSMT5Me1H
 q+fZMceidl7E/8nqrPy8pkbdAuqrizDyl71xVQfPp8b+TsS695S3j6HxwuDnj/nPJvDcqNVoU
 52c6+q2/38y17JPGjQSdtkl4XdcSTMR3fKZlvoMfzx2mv7OJJMGmpu87PSagytlwI5WEvT3ws
 KQrBwY968wA/sWtR5qlqcVJAtY/Eh+KvKQgZ6VOkqc5p1AtHAMGOHC9CE2n+Vv20qdQ3IN0Tz
 owLgVssK9l06VR5RCM2yODqR9CXaAKxSOlnKHtbfJAtOqEDzADKp0JAT50TAjm0uNVH2lcc5X
 iqGrn1U2rkmRl+rAh9a3cEaKduol0zJwVbthtC6+lMaatxgRplf9l2pidXSjTIyhDC0hS16wE
 EPbC8OoqsVkO5N97mPeBXuFYfc9+NGRPTyrAQJhadrQk3SgqVhFR6aJz/dig7yGKr3IijJapN
 u05sqfk4Q9+EpDDhW5HOnc=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

It's possible to convert the if statement into a continue early and
save an indention level.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 71 +++++++++++-----------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index b3e81ac..2ac3545 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2578,42 +2578,43 @@ release_service_messages(struct vchiq_service *service)
 	for (i = state->remote->slot_first; i <= slot_last; i++) {
 		struct vchiq_slot_info *slot_info =
 			SLOT_INFO_FROM_INDEX(state, i);
-		if (slot_info->release_count != slot_info->use_count) {
-			char *data =
-				(char *)SLOT_DATA_FROM_INDEX(state, i);
-			unsigned int pos, end;
+		unsigned int pos, end;
+		char *data;
 
-			end = VCHIQ_SLOT_SIZE;
-			if (data == state->rx_data)
-				/*
-				 * This buffer is still being read from - stop
-				 * at the current read position
-				 */
-				end = state->rx_pos & VCHIQ_SLOT_MASK;
-
-			pos = 0;
-
-			while (pos < end) {
-				struct vchiq_header *header =
-					(struct vchiq_header *)(data + pos);
-				int msgid = header->msgid;
-				int port = VCHIQ_MSG_DSTPORT(msgid);
-
-				if ((port == service->localport) &&
-					(msgid & VCHIQ_MSGID_CLAIMED)) {
-					vchiq_log_info(vchiq_core_log_level,
-						"  fsi - hdr %pK", header);
-					release_slot(state, slot_info, header,
-						NULL);
-				}
-				pos += calc_stride(header->size);
-				if (pos > VCHIQ_SLOT_SIZE) {
-					vchiq_log_error(vchiq_core_log_level,
-						"fsi - pos %x: header %pK, msgid %x, header->msgid %x, header->size %x",
-						pos, header, msgid,
-						header->msgid, header->size);
-					WARN(1, "invalid slot position\n");
-				}
+		if (slot_info->release_count == slot_info->use_count)
+			continue;
+
+		data = (char *)SLOT_DATA_FROM_INDEX(state, i);
+		end = VCHIQ_SLOT_SIZE;
+		if (data == state->rx_data)
+			/*
+			 * This buffer is still being read from - stop
+			 * at the current read position
+			 */
+			end = state->rx_pos & VCHIQ_SLOT_MASK;
+
+		pos = 0;
+
+		while (pos < end) {
+			struct vchiq_header *header =
+				(struct vchiq_header *)(data + pos);
+			int msgid = header->msgid;
+			int port = VCHIQ_MSG_DSTPORT(msgid);
+
+			if ((port == service->localport) &&
+				(msgid & VCHIQ_MSGID_CLAIMED)) {
+				vchiq_log_info(vchiq_core_log_level,
+					"  fsi - hdr %pK", header);
+				release_slot(state, slot_info, header,
+					NULL);
+			}
+			pos += calc_stride(header->size);
+			if (pos > VCHIQ_SLOT_SIZE) {
+				vchiq_log_error(vchiq_core_log_level,
+					"fsi - pos %x: header %pK, msgid %x, header->msgid %x, header->size %x",
+					pos, header, msgid,
+					header->msgid, header->size);
+				WARN(1, "invalid slot position\n");
 			}
 		}
 	}
-- 
2.7.4

