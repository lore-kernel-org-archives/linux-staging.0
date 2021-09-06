Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A1B3FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:18 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id u15-20020a05600c19cf00b002f6445b8f55so3659026wmq.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kg+wkIsJvugQzYYd9VoPwfr1sfAxVMJnOuxjBgJqvgQ=;
        b=q+RcmpdcWp2/T+c4qm3rKWDHqDJhV2LiDW728JghmS8Rfbj0umCUeWmljsF46Gx5SD
         VduHRsL3ETm2Rg0zGFbzZQoQxoflwnjiA9O7BdUtm+GrU4MQVIhClanDVU3DQqQ3o7Dp
         gU8PRImoEURDRIWI9GuC1n/v9gokYck9DACfi9kiI72mOZeidYHlCNj5BiuMcs80f0hQ
         fxFhXanrC5WezvkpzwDuLXU4UXVd6aSmIP6KGCcOOd5x/py/FJZUJwfKQcLpgSt/Aygl
         Hj7+iIFZlRtTpJ229pKG/3PC89zBlwCbkASpGbq7QQDDKXQwtd32vW1Oi3/Judiw1en6
         oTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kg+wkIsJvugQzYYd9VoPwfr1sfAxVMJnOuxjBgJqvgQ=;
        b=FzuQfspL63jRPZYOql9v42asxNIGiAv5Fj3GYv/cHVIsr2LK4AMXvN7exgF7p3XoW+
         UQwM+OH2ec2Kw+RpILDQScWXnLZJYaXnD/jlqk9dFgnTKvrIpvRH9klLZT3y4LyxPebS
         O3rj1tVR5Ob0le8z+nvB4ACotpDjd9HSE/3X9TAPrrVt6j4e277wdsG88G9wKZt8R0Ht
         1QgfMr1ePPHbPCf5rERSlIKaBU99tuduTQXBVddbNDuq2+YNXKVJywoYK4cqDsbHmids
         pfFL7ThWnLFCdiJ6hj0vbu3xktX36fH3Vz4QB7M9FHiIUZdtvnliMdOD4/Dtva0JoKx3
         FpvA==
X-Gm-Message-State: AOAM5333qmEKwaa/Cu36VyHpdaekh6GqXlVrCc5Dp9a8QaDWyMGqjH4k
	PIn2WBjVKVmXQGrPyL3E5/5kGg==
X-Google-Smtp-Source: ABdhPJwxrocPwckLhyNGSywhwMgBpEEwk4LJWLg1XvQpuhig8Ty5FSipbjigf7IeL6dbkbYvRHs1tA==
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr8904435wmq.83.1630890077189;
        Sun, 05 Sep 2021 18:01:17 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:16 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/14] staging: r8188eu: remove hal_xmitframe_enqueue from struct hal_ops
Date: Mon,  6 Sep 2021 02:01:02 +0100
Message-Id: <20210906010106.898-11-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906010106.898-1-phil@philpotter.co.uk>
References: <20210906010106.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove hal_xmitframe_enqueue function pointer from struct hal_ops, as it
is unused.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index b30968a94fbf..b47fcdcf2027 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -202,8 +202,6 @@ struct hal_ops {
 			    struct xmit_frame *pxmitframe);
 	s32 (*mgnt_xmit)(struct adapter *padapter,
 			 struct xmit_frame *pmgntframe);
-	s32 (*hal_xmitframe_enqueue)(struct adapter *padapter,
-				     struct xmit_frame *pxmitframe);
 
 	u32	(*read_bbreg)(struct adapter *padapter, u32 RegAddr,
 			      u32 BitMask);
-- 
2.31.1

