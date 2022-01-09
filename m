Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574FA2CA5
	for <linux-staging@lists.linux.dev>; Sun,  9 Jan 2022 21:54:33 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q8so23168072wra.12
        for <linux-staging@lists.linux.dev>; Sun, 09 Jan 2022 13:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/xQgPdF4pLZ7rSZV7wFE+mDlaQQE7y+ojmrtCNp2S0=;
        b=mtH68rJeTi1TCPm8g4SR/TY0WUCwPBzeSVXMbAf1eSEUkBL7UC6voDIyjPs+H2bweC
         Mj0SwpyaSvyEBT+HJdTbrFvfP5JD4hLxF/vTG3/77qPB0DMd0hypZRDvDwgOFIuu/HBR
         Sd2Rsy4ieJ90ew392xiVLXJnSHnrjU08kRVgzXF5i+ppzRHLM/0zHgPRtqJhSPCc9u35
         r9qP+IUqZa9+Z+vIcXB6juEHd8rak25RiuNnTYWyQdh/ZPVMzoocbOqRMutPduN+q9Gu
         MLxisPEyWtarAnE6Nm/hnBL4hP3P8RPRg1HCbNQANANg88FsBnOezs/ZVT/N64cPBffD
         Kgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/xQgPdF4pLZ7rSZV7wFE+mDlaQQE7y+ojmrtCNp2S0=;
        b=PFf2WBStpv4rSfFC/X2qiVe2xTmV/FJ5sKSp28RXzMeWQOZDyNcOAZMNL9sHCrEmas
         dHZjiSd8t4BInNtLtic8a8RhsZUfsnERC/kA0pKQrWkbdJZQ6HfRLeVeASN8KRk6Y7XZ
         wBw+5hGagFWajaeP7vtNTjvfhhbl2OxqrjI1YSIcdrhclm3rrAoWHltKxpHuZ611f3/p
         +3ItOpEcvVCCSvkYfAL00aYwo6zbJDxtc6NRwFMuYYJlsJyT9Fy+ZJBpkekVedUHhtnt
         oZn0epfWfpL9wKMm+w84orYxSRNoLdC9fOX2tksWzAIo6PqDG96AD2jAWWv2809gXzGY
         S4sQ==
X-Gm-Message-State: AOAM533/rRaIkkBnA/nye74OdaUpVmxg+1FTddkffX9Cl0m4RN0IyT9u
	ca6OEYKcjdVb1vrc0OT5d1P4lw==
X-Google-Smtp-Source: ABdhPJyvbrJiyg+WkmzDY0n4DUHVXi0xtNTepHogOuVbyWf7jbsxCDl8Q0KKy1GDTYe3iJ0wj+n90g==
X-Received: by 2002:a5d:584e:: with SMTP id i14mr6157958wrf.255.1641765271791;
        Sun, 09 Jan 2022 13:54:31 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r13sm5065650wmq.28.2022.01.09.13.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 13:54:31 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] staging: r8188eu: convert DBG_88E calls in core/rtw_iol.c
Date: Sun,  9 Jan 2022 21:54:23 +0000
Message-Id: <20220109215427.887-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109215427.887-1-phil@philpotter.co.uk>
References: <20220109215427.887-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the DBG_88E macro calls in core/rtw_iol.c to use pr_debug
or netdev_dbg appropriately, as their information may be useful to
observers, and this gets the driver closer to the point of being
able to remove DBG_88E itself.

Some calls are at points in the call chain where use of dev_dbg or
netdev_dbg isn't possible due to lack of device pointer, so plain
pr_debug is appropriate here.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_iol.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index 7e78b47c1284..923da2a9f6ae 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -12,13 +12,15 @@ struct xmit_frame	*rtw_IOL_accquire_xmit_frame(struct adapter  *adapter)
 
 	xmit_frame = rtw_alloc_xmitframe(pxmitpriv);
 	if (!xmit_frame) {
-		DBG_88E("%s rtw_alloc_xmitframe return null\n", __func__);
+		netdev_dbg(adapter->pnetdev,
+			   "rtw_alloc_xmitframe return null\n");
 		return NULL;
 	}
 
 	xmitbuf = rtw_alloc_xmitbuf(pxmitpriv);
 	if (!xmitbuf) {
-		DBG_88E("%s rtw_alloc_xmitbuf return null\n", __func__);
+		netdev_dbg(adapter->pnetdev,
+			   "rtw_alloc_xmitbuf return null\n");
 		rtw_free_xmitframe(pxmitpriv, xmit_frame);
 		return NULL;
 	}
@@ -49,8 +51,8 @@ int rtw_IOL_append_cmds(struct xmit_frame *xmit_frame, u8 *IOL_cmds, u32 cmd_len
 
 	/* check if the io_buf can accommodate new cmds */
 	if (ori_len + cmd_len + 8 > MAX_XMITBUF_SZ) {
-		DBG_88E("%s %u is large than MAX_XMITBUF_SZ:%u, can't accommodate new cmds\n",
-			__func__, ori_len + cmd_len + 8, MAX_XMITBUF_SZ);
+		pr_debug("%u is larger than MAX_XMITBUF_SZ:%u, can't accommodate new cmds\n",
+			 ori_len + cmd_len + 8, MAX_XMITBUF_SZ);
 		return _FAIL;
 	}
 
-- 
2.33.1

