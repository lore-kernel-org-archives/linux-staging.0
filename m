Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BB93FDE
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 20:01:20 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id o124so17232832vsc.6
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 13:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HoLG1xadIhb37Moe2giR32FgTB7t+l3y/OOs4uvCyVs=;
        b=kRbNTeXD+RgsVyU+Ta1fIauroLL94BIu81u4UdVoSQ3vZ/s97G1QIAsvktd1ELdHqt
         3kyU7q5jZhJPN8a8LircbdF15h57AClMJ7m23KXXr8DFDaabNSNfxjD4/UnPv4Kmxb+l
         C1800PprDhyO1eu+vyGLSj0wEd3J4bmH0C+eMQ9Ag1XQ0F5MBNwZw2m7eVae7eTHlfM8
         yrgTzogDb4agXC3KLrqQRZPBH02PTlxzL5bToocS3rk22S581yPGbV7AOy63GNhn5T7o
         dAC26OGoOASnpRjoEgJ5Zge0mijYwQu1tJPhO/fGP3XJBV8S0fsGqR26nHlyFWrGaLGb
         8xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HoLG1xadIhb37Moe2giR32FgTB7t+l3y/OOs4uvCyVs=;
        b=aGp/ELLpNC/zfdUkR8GHf2t8S+RoG2SN98PT3YqTq5cYmwSUz/bUnQluLaVNybZALL
         Mo7B9SXOVpZFyIIvF5UnIA3PW7QNt9yWVrkLO23c+XYG3SoQFZGzEQ3LLoygu0EwdasM
         j9KLySRIkSn5n1HDYGSRY+u/aHFMe+89AIbkPuPONZcKSZ5fpc5CP+Ug9nmO7uAXOy+1
         gkTK5uuz0HJxPAYZ2KFsK7Zc6DvQkoPzOhtm5c7hH2rN4qe2RmDnIa/siWsMbsLhVmVV
         QYs5HWa73HQ5xchdQ2Jro9AHOO9G9/ASD5/iWJrpMwaWaIJbxKBDZi/+FdEhGFvb0y9C
         YLtQ==
X-Gm-Message-State: AOAM533EW89uiyoebwwD8cYse+jknUxhjd5KfoqiMYji7m0Zc5lC7l8e
	6mrnNuzsOLERZHN490JCwDAVEMbJHlVfVQ==
X-Google-Smtp-Source: ABdhPJyeB65tXOofex2kQAVQOCCG+rInAXqURozdvA+f5Qf1SXX0kpuXaERC1WMRcV4As2POF2ghmw==
X-Received: by 2002:a05:6102:226f:: with SMTP id v15mr10767172vsd.50.1633291279744;
        Sun, 03 Oct 2021 13:01:19 -0700 (PDT)
Received: from localhost.localdomain ([181.23.73.135])
        by smtp.gmail.com with ESMTPSA id x21sm6691019uao.2.2021.10.03.13.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 13:01:19 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 4/9] staging: vchiq_core.h: use preferred kernel types
Date: Sun,  3 Oct 2021 16:57:57 -0300
Message-Id: <20211003195758.36572-5-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003195758.36572-1-gascoar@gmail.com>
References: <20211003195758.36572-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change types from uint32_t and uint64_t to the preferred ones u32 and
u64.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.h   | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 383c3bcf787e..a107c72ce3a6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -74,7 +74,7 @@
 	((fourcc) >>  8) & 0xff, \
 	(fourcc) & 0xff
 
-typedef uint32_t BITSET_T;
+typedef u32 BITSET_T;
 
 static_assert((sizeof(BITSET_T) * 8) == 32);
 
@@ -231,10 +231,10 @@ struct vchiq_service {
 		int bulk_tx_count;
 		int bulk_rx_count;
 		int bulk_aborted_count;
-		uint64_t ctrl_tx_bytes;
-		uint64_t ctrl_rx_bytes;
-		uint64_t bulk_tx_bytes;
-		uint64_t bulk_rx_bytes;
+		u64 ctrl_tx_bytes;
+		u64 ctrl_rx_bytes;
+		u64 bulk_tx_bytes;
+		u64 bulk_rx_bytes;
 	} stats;
 
 	int msg_queue_read;
@@ -622,7 +622,7 @@ extern void
 vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate);
 
 extern void
-vchiq_log_dump_mem(const char *label, uint32_t addr, const void *void_mem, size_t num_bytes);
+vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem, size_t num_bytes);
 
 extern enum vchiq_status vchiq_remove_service(unsigned int service);
 
-- 
2.33.0

