Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279FC6D0D
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 23:50:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b13so393461wrs.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 16:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+m3BtSABkvmdLkwH7PXhgpCYw0RdvCvmBAQL6bV+6/w=;
        b=gWxx0hurSO6vJMt8tkjjyjZj+FnBIvpiCY4XYSZcImRBhVn5PzEY2iSFUPOohmsvLF
         D68xxgB51rmiERFOeOl/MCweSS2J98yYgc3UbQXzIKfJYsu5UuF6bg3glb0Zeyv4uge1
         QOwTtaJQX1uYn6iK71A0tIf8jZls2wUuRSOQsLimxMpP92hEmhm0u4wgl0Ta5JW9CyDC
         hlse9HxINCTqoYeOq7GcreQPGSdFE5Y92wimXvYbt7XuTrVNpmaePlUnDWmtUFq8680l
         15pPocsUvUZHbChne6pQBJFghvubSt+IVrQW5Nu0/91J/v0zyR4xrLuA7IrEjoyUmqAd
         oz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+m3BtSABkvmdLkwH7PXhgpCYw0RdvCvmBAQL6bV+6/w=;
        b=C0V5zzJ8TWzGMLNLRh5h/taZNpqguOx4mszRs39MWLIh/UedS/x+1uPTMpCzpGDdif
         uR6Wi7DG0lEhTHcOdbm2eO/bxYFQKpCdyOmTRVPcAukE5L69ilmrKjiX9wh2M8wsbofs
         Wd22qVzrFVdCoa4m1FLOyJFUD55USfY3NiuBo1SPEWRGbYTzhVGLb4hYyjAZFizwJRnC
         wW97TwhIX22jRpci7ZGPWOJx6b7qEMSQ9umAe6FB51htr07kj02W1rXo7si8hNKGVZMe
         id8z1Xb+PYgfMjy9Xwa6zpQTquRp34hC4yiRnS1kMc6+uNDtE8txe6IUIiAcpm/teoJi
         V86A==
X-Gm-Message-State: AOAM53115fGCpotTp4Lfm4JhtxsFY0oQcypS5vxYPwpSet+Uj1ZdeXGY
	cI/v8dFwh6dih/lOcdQfD/J0Vp5mduIC9brkAfQ=
X-Google-Smtp-Source: ABdhPJzpVf3k/8X7clnMPjY2XJANhf8crbeeVGsD8Kdr7YqcNvin6pvjg7NlianalxB0nRCVSv1sVw==
X-Received: by 2002:a5d:64c2:: with SMTP id f2mr33102159wri.128.1628639453635;
        Tue, 10 Aug 2021 16:50:53 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id p14sm13881220wro.3.2021.08.10.16.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 16:50:53 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] staging: r8188eu: remove unused variable from rtw_init_drv_sw
Date: Wed, 11 Aug 2021 00:50:45 +0100
Message-Id: <20210810235047.177883-7-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810235047.177883-1-phil@philpotter.co.uk>
References: <20210810235047.177883-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused variable from rtw_init_drv_sw function in
os_dep/os_intfs.c

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/os_dep/os_intfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 38d3283dbac3..1eb53cf8bccb 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -852,7 +852,6 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 u8 rtw_init_drv_sw(struct adapter *padapter)
 {
 	u8	ret8 = _SUCCESS;
-	unsigned long flags;
 
 	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL) {
 		ret8 = _FAIL;
-- 
2.31.1

