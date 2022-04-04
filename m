Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3BE28E8;
	Mon,  4 Apr 2022 14:39:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h4so14777645wrc.13;
        Mon, 04 Apr 2022 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ezm7s/bPPlsKI3j5Vodd/A01CmYTO8Su6wSyqI3TlXY=;
        b=YwX2YHH9SfzSWfpOg5TmK7w79nGo2g57qnkikIFBOAJNPurOj2AeWp2y2GJDQMNRQo
         VPEa85uc0l8dCprSmr5BOnsWoPk8vPYjjtOlwJZaOb4XoNPz6+qmlApMVIAcNY7anQAa
         Cr5kcgA081NzJXrGn3cjAKh3m0nR5fV74Pnz1u3tcsM+KmEMxJ/wBXxmJx5d6nkMgyOi
         /iXbOaAy+LvPi7Nmbl+gneboS6mo1JgXvqPZX3BUP8Cq1uRk5+nrUwN7o47SeaJBpdZP
         oNnQfUV2ztUXqwtxrmSC5j1LH31tYrOxnxNIpx2OGX7OQrXdePRPPBIg3qn3Dtb7yZ49
         WcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ezm7s/bPPlsKI3j5Vodd/A01CmYTO8Su6wSyqI3TlXY=;
        b=XNjCZyXeIL0RXSxUnfE0AdPqF+tEXu1RbKiCQwvyG+GM2DMVyGwzM8WKFfTrbSjzrf
         dJzXRZLvjfNAdWBh46USZnNG8OO+t2YrktnZlOtloqmHBayxN4+nUacNXNsLBd9L7qFe
         Qax0fbWoTx1XWHDqYBuEL27hjPbDfFR2szwi9a3OtY1dF3tMAorUtDxUm0Y1a16Q9zMY
         rwctp3ffCmqYYvg4TWLPdEGyven7OqtXGfDMy96rSv4sla6O/Ph14F5/vOiQ0XDtV2PK
         trXfoqj2D9zhmIkiUHT/cwk4lzcTBwMn5V9S0LyG3PTXVslBNqXyz6QTiwG+OL/SBfst
         sZsw==
X-Gm-Message-State: AOAM530J4BXFs+RYXVrcuMyMzaqe0OjR++em3qBPsB6cIR8K6vPJdt3e
	5Y4WGktWtklhwnnY/xuvxPc=
X-Google-Smtp-Source: ABdhPJym4Ae6g+MhdncKokbHAsqQnkyzEtw7DFFFy5O0cd45KZebnaDdSU2lJZ575HmSr7bcg+2p7A==
X-Received: by 2002:a5d:5512:0:b0:1ef:5f08:29fb with SMTP id b18-20020a5d5512000000b001ef5f0829fbmr17064670wrv.653.1649083165929;
        Mon, 04 Apr 2022 07:39:25 -0700 (PDT)
Received: from alaa-emad ([41.42.174.117])
        by smtp.gmail.com with ESMTPSA id y2-20020adffa42000000b002060d53dbe0sm6142385wrr.9.2022.04.04.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 07:39:25 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH 2/2] staging: r8188eu: Add line after declarations
Date: Mon,  4 Apr 2022 16:39:17 +0200
Message-Id: <19d8f316e43d16c9341f7fe94e68534cf60cc05c.1649082939.git.eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <860d8e222e2b695ce5cb4f48aa46a7f66e05d8e4.1649082939.git.eng.alaamohamedsoliman.am@gmail.com>
References: <860d8e222e2b695ce5cb4f48aa46a7f66e05d8e4.1649082939.git.eng.alaamohamedsoliman.am@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

WARNING: Missing a blank line after declarations

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 7c664f80fa99..f7811b46db1c 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -313,6 +313,7 @@ void nat25_db_cleanup(struct adapter *priv)
 
 	for (i = 0; i < NAT25_HASH_SIZE; i++) {
 		struct nat25_network_db_entry *f;
+
 		f = priv->nethash[i];
 		while (f) {
 			struct nat25_network_db_entry *g;
@@ -339,12 +340,12 @@ void nat25_db_expire(struct adapter *priv)
 
 	for (i = 0; i < NAT25_HASH_SIZE; i++) {
 		struct nat25_network_db_entry *f;
-		f = priv->nethash[i];
 
+		f = priv->nethash[i];
 		while (f) {
 			struct nat25_network_db_entry *g;
-			g = f->next_hash;
 
+			g = f->next_hash;
 			if (__nat25_has_expired(f)) {
 				if (atomic_dec_and_test(&f->use_count)) {
 					if (priv->scdb_entry == f) {
-- 
2.35.1

