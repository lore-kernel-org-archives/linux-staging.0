Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B662ECEB9
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 04:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783226398; cv=none; b=abQQTo9RmD5+It1WDuOW14r5zOwk0WfAPJJQ8pdvQBgrjagg1885G4H6X85Qlgq4jTNY1q+eMOVC1Afq14xx4m+8n/VdsbbJ7CYdwTBgXcHlK4e8wUhPtla7JNePKCW2EngZGNqz/DqHe4ZxoULt7xNLgl2s1IMwDsAY4sG/vuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783226398; c=relaxed/simple;
	bh=q90RW5tH6qtrTmmd6q8COrQ5Zm3MxujrL6aUddy+6Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e0cGXJXZiAsnhExVIdS/9gFSl9VmB6nyhdEgrmrBoHNeKAoIhA7pAfIUB+bP/80Wycf19pHAZIwVrDv7EszmuqIFbsP9j4wm8xsV5k1EpEFjvsywO8YjZNBps5eUBNOBnrvoe/doLXW0ogoD5fk32lGmHb5GoIoLWQxHOi7lQU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZ2aFeDe; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZ2aFeDe"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80c4d1520c9so714087b3.3
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 21:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783226394; x=1783831194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbdlEf2xTWXJzXgVbM2XWeDt8l4xTUKqs5M3XQtEYUY=;
        b=sZ2aFeDe9X8Zb3Up0NcnxJZrX6S711/1FjvGDtwfn8blaJQg7uvRttc1YijJuX98p6
         wCumF/sgf9mYyMQ98UGCSikIXSgS8eLtDAKxqyonAKCVMl3DTXJdJq+kdQprVXi40l82
         DLtivXRKG+JRP5HimuX0NWvTCQljiNqLSQb7uPzQ2DI8+YYUxscNYRQsYqYK/9nn3Z5f
         xZM9fUNqvk0udJooE+QS+3tEeo852rLEVKOTqy7gAgUq3N3NKtPTIsLReiEZePnZxO0u
         LCzKwEnrvp0T8UN5rFcU07ffffETOeWAzZIjAvVVlpX6y1ZvnNA8AoK0sLYcra7yRSDH
         Fe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783226394; x=1783831194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbdlEf2xTWXJzXgVbM2XWeDt8l4xTUKqs5M3XQtEYUY=;
        b=aattymDBXSFMMd866zTWan8GttlVKL+vsG9i2xJJ9xn4Z9cwNj0OHjzNm80993jYJf
         ATRRsySl2YDicpwAgMLFavAIucQVqEjjK5JlaNNouek5xEypwUOpnl8ZIPZNFJu0wa2K
         wxBGsY18Y6MoZuWm/yy/NIHm1/R+2Jln3COPIsOCfPvFol0KkCvOt203ZOlUfeTak0q/
         M8rF6l4r5lTNfiesCVvbFiP4TL0OTdEavO94jGwDTJzT5dzgQWP47dRDDBhFlTKYlEQ2
         NrNgp/gFXNG00dWOqTitARBVj2XOuNMG+cZa80iqVRSLLkn1kho3DvFpzz5KTLJdh1P6
         6vFw==
X-Forwarded-Encrypted: i=1; AHgh+RoP5TAmEYS3TUP+oHVsl8YhAz1kplP7Py+T8Qsc3+FNMguwHVY3XS17jPFzwA+mPeyBP5s2vO5MC9UtWBl5@lists.linux.dev
X-Gm-Message-State: AOJu0Yx37d8+VQCqalbEfXqS+qk8t2djgtYzpQdheM/rkU85FXZZRIz5
	YcuHJA6jgIc01RwUkjeNfKjeQcZbeQMnqTd0yF6qv499Xdju9jwZcRar
X-Gm-Gg: AfdE7cm6XJDu/tzzCYqOvqc9f1Qy9qZ4jbydwO1QCwc5M+ivYX4F38Y1ZlxNu9fGcu9
	53CKueICz83uhHMnew4sBZvGX5YIqNUzvoF57JbHcn0JRC/IGuMFv9ZKQht83PiIsSQ7WolTHeo
	U50SmgMPidfDEfptPYqfAoPGr70mL9KsqAsftIno7DokXsk8FYkLsiovQnouV1AWwWmd0QUDUw6
	eZ2BHAwy2mkXPlQo8B/5348xPYhFET+HqeqTU/4MuD2r3MTsXL9uQf53KTXdVlHWdyFjrNjlUVy
	MamMnXXsoIGVRPlY83/IAKf3zGJSxYbjPPIFAYy6Tmsg3HafXjEpXnb5hzgCt/r+ctz79xOuOCY
	fPilhfG5lRYzZhvp1659o0LoqiU1/g9teiOGAVZehY61jVReDhOgfTMF+PfWllEd3Ox14
X-Received: by 2002:a05:690c:d84:b0:7ba:d784:8b59 with SMTP id 00721157ae682-817218a3116mr57259757b3.7.1783226394279;
        Sat, 04 Jul 2026 21:39:54 -0700 (PDT)
Received: from desktop ([2600:1700:78e0:fd0::27])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144bd2b44fsm42051997b3.47.2026.07.04.21.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 21:39:53 -0700 (PDT)
From: Neal Patalay <nealpatalay0@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mugrinphoto@gmail.com,
	matt@mattwardle.net,
	nealpatalay0@gmail.com
Subject: [PATCH v2] staging: media: atomisp: refactor pipe graph dump stage formatting
Date: Sat,  4 Jul 2026 21:39:20 -0700
Message-ID: <20260705043920.105252-1-nealpatalay0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original implementation of ia_css_debug_pipe_graph_dump_stage()
includes an off-by-one error where the original strscpy() size dropped
characters immediately before newlines. It also allocates over 600
bytes across multiple buffers on the stack. Address these shortcomings
and reduce stack usage with a single 256 byte buffer via a new helper
function, ia_css_debug_build_info().

Fixes: 662fb4fceb1a ("media: atomisp: get rid of a string_support.h abstraction layer")
Signed-off-by: Neal Patalay <nealpatalay0@gmail.com>
---
v2:
- Fixed strscpy typo in commit message
- Changed Fixes tag to point to the actual buggy commit
- Dropped "flag" parameter from helper function and moved check to the macro
- Split long lines to conform with subsystem character limit
---
 .../pci/runtime/debug/src/ia_css_debug.c      | 186 +++++++-----------
 1 file changed, 71 insertions(+), 115 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..53d47144d8c9 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1162,6 +1162,29 @@ void ia_css_debug_pipe_graph_dump_epilogue(void)
 	pg_inst.stream_format = N_ATOMISP_INPUT_FORMAT;
 }
 
+static void ia_css_debug_build_info(char *info, size_t info_size,
+				    int *offset,
+				    const char *flag_str, size_t flag_str_size,
+				    int *line_len)
+{
+	/*
+	 * If new line length exceeds max line length,
+	 * replace the last ',' with a "\\n"
+	 */
+	if (*line_len > 0 && info_size - *offset >= 2 &&
+	    *line_len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
+		info[*offset - 1] = '\\';
+		info[*offset] = 'n';
+		*offset += 1;
+		*line_len = 0;
+	}
+
+	int len_written = scnprintf(info + *offset, info_size - *offset,
+				    "%s,", flag_str);
+	*offset += len_written;
+	*line_len += len_written;
+}
+
 void
 ia_css_debug_pipe_graph_dump_stage(
     struct ia_css_pipeline_stage *stage,
@@ -1194,123 +1217,56 @@ ia_css_debug_pipe_graph_dump_stage(
 
 	/* Guard in case of binaries that don't have any binary_info */
 	if (stage->binary_info) {
-		char enable_info1[100];
-		char enable_info2[100];
-		char enable_info3[100];
-		char enable_info[302];
+		char enable_info[256];
+		int offset = 0;
+		int line_len = 0;
 		struct ia_css_binary_info *bi = stage->binary_info;
 
-		/* Split it in 2 function-calls to keep the amount of
-		 * parameters per call "reasonable"
-		 */
-		snprintf(enable_info1, sizeof(enable_info1),
-			 "%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
-			 bi->enable.reduced_pipe ?	"rp," : "",
-			 bi->enable.vf_veceven ?		"vfve," : "",
-			 bi->enable.dis ?		"dis," : "",
-			 bi->enable.dvs_envelope ?	"dvse," : "",
-			 bi->enable.uds ?		"uds," : "",
-			 bi->enable.dvs_6axis ?		"dvs6," : "",
-			 bi->enable.block_output ?	"bo," : "",
-			 bi->enable.ds ?			"ds," : "",
-			 bi->enable.bayer_fir_6db ?	"bf6," : "",
-			 bi->enable.raw_binning ?	"rawb," : "",
-			 bi->enable.continuous ?		"cont," : "",
-			 bi->enable.s3a ?		"s3a," : "",
-			 bi->enable.fpnr ?		"fpnr," : "",
-			 bi->enable.sc ?			"sc," : ""
-			);
-
-		snprintf(enable_info2, sizeof(enable_info2),
-			 "%s%s%s%s%s%s%s%s%s%s%s",
-			 bi->enable.macc ?		"macc," : "",
-			 bi->enable.output ?		"outp," : "",
-			 bi->enable.ref_frame ?		"reff," : "",
-			 bi->enable.tnr ?		"tnr," : "",
-			 bi->enable.xnr ?		"xnr," : "",
-			 bi->enable.params ?		"par," : "",
-			 bi->enable.ca_gdc ?		"cagdc," : "",
-			 bi->enable.isp_addresses ?	"ispa," : "",
-			 bi->enable.in_frame ?		"inf," : "",
-			 bi->enable.out_frame ?		"outf," : "",
-			 bi->enable.high_speed ?		"hs," : ""
-			);
-
-		/* And merge them into one string */
-		snprintf(enable_info, sizeof(enable_info), "%s%s",
-			 enable_info1, enable_info2);
-		{
-			int l, p;
-			char *ei = enable_info;
-
-			l = strlen(ei);
-
-			/* Replace last ',' with \0 if present */
-			if (l && enable_info[l - 1] == ',')
-				enable_info[--l] = '\0';
-
-			if (l > ENABLE_LINE_MAX_LENGTH) {
-				/* Too big for one line, find last comma */
-				p = ENABLE_LINE_MAX_LENGTH;
-				while (ei[p] != ',')
-					p--;
-				/* Last comma found, copy till that comma */
-				strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));
-
-				ei += p + 1;
-				l = strlen(ei);
-
-				if (l <= ENABLE_LINE_MAX_LENGTH) {
-					/* The 2nd line fits */
-					/* we cannot use ei as argument because
-					 * it is not guaranteed dword aligned
-					 */
-
-					strscpy(enable_info2, ei, umin(l, sizeof(enable_info2)));
-
-					snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
-						 enable_info1, enable_info2);
-
-				} else {
-					/* 2nd line is still too long */
-					p = ENABLE_LINE_MAX_LENGTH;
-					while (ei[p] != ',')
-						p--;
-
-					strscpy(enable_info2, ei, umin(p, sizeof(enable_info2)));
-
-					ei += p + 1;
-					l = strlen(ei);
-
-					if (l <= ENABLE_LINE_MAX_LENGTH) {
-						/* The 3rd line fits */
-						/* we cannot use ei as argument because
-						* it is not guaranteed dword aligned
-						*/
-						strscpy(enable_info3, ei,
-							sizeof(enable_info3));
-						snprintf(enable_info, sizeof(enable_info),
-							 "%s\\n%s\\n%s",
-							 enable_info1, enable_info2,
-							 enable_info3);
-					} else {
-						/* 3rd line is still too long */
-						p = ENABLE_LINE_MAX_LENGTH;
-						while (ei[p] != ',')
-							p--;
-						strscpy(enable_info3, ei,
-							umin(p, sizeof(enable_info3)));
-						ei += p + 1;
-						strscpy(enable_info3, ei,
-							sizeof(enable_info3));
-						snprintf(enable_info, sizeof(enable_info),
-							 "%s\\n%s\\n%s",
-							 enable_info1, enable_info2,
-							 enable_info3);
-					}
-				}
-			}
-		}
+#define ADD_INFO(flag, flag_str)						\
+		do {								\
+			if (bi->enable.flag)					\
+				ia_css_debug_build_info(enable_info,		\
+							sizeof(enable_info),	\
+							&offset,		\
+							flag_str,		\
+							sizeof(flag_str),	\
+							&line_len);		\
+		} while (0)
+
+		/* Build string in enable_info buffer */
+		ADD_INFO(reduced_pipe, "rp");
+		ADD_INFO(vf_veceven, "vfve");
+		ADD_INFO(dis, "dis");
+		ADD_INFO(dvs_envelope, "dvse");
+		ADD_INFO(uds, "uds");
+		ADD_INFO(dvs_6axis, "dvs6");
+		ADD_INFO(block_output, "bo");
+		ADD_INFO(ds, "ds");
+		ADD_INFO(bayer_fir_6db, "bf6");
+		ADD_INFO(raw_binning, "rawb");
+		ADD_INFO(continuous, "cont");
+		ADD_INFO(s3a, "s3a");
+		ADD_INFO(fpnr, "fpnr");
+		ADD_INFO(sc, "sc");
+		ADD_INFO(macc, "macc");
+		ADD_INFO(output, "outp");
+		ADD_INFO(ref_frame, "reff");
+		ADD_INFO(tnr, "tnr");
+		ADD_INFO(xnr, "xnr");
+		ADD_INFO(params, "par");
+		ADD_INFO(ca_gdc, "cagdc");
+		ADD_INFO(isp_addresses, "ispa");
+		ADD_INFO(in_frame, "inf");
+		ADD_INFO(out_frame, "outf");
+		ADD_INFO(high_speed, "hs");
+
+#undef ADD_INFO
+
+		/* Replace last ',' with '\0' */
+		if (offset > 0)
+			enable_info[offset - 1] = '\0';
+		else
+			enable_info[0] = '\0';
 
 		dtrace_dot("node [shape = circle, fixedsize=true, width=2.5, label=\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
 			   bin_type, blob_name, enable_info, blob_name, id);
-- 
2.55.0

