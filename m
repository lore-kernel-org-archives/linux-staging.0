Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D99C2CA2
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:05:46 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id d5so9406217pjk.5
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xa9/uQimRO4U5DdZfy5OHCYx6e+VSAPR4ymHWAiOiFc=;
        b=nitZL45Jd8jjpmzytmvzZg4RNy1iCWk6koqbhkdU1VvecYhAnNMJIExE7JcVSBVnkU
         khBVIo/39rVRwuAUJAHUdiuvYXA4DoqN9hIb4W56m34+quB80y8obNhshlBxcBwwb188
         T+e+kie/Geu4QFabfsT40lKBOyY26ijKOpL+rxEyn0hSk86kkNXdmwYcLDKsG2/AE+Mc
         2Y0zv7OkmR8j2Qb4KdENcjqEn+rM8X1f7whpg4Q8eSlEWjBpxDIn+rTwyyL5ICZaTlrJ
         5UmWwAWdg7GpPQ+3CXsJtbzvejV+5LipP+U+chLXcwBrf3to+Cxfxk1aoWgydyga/ItY
         j4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xa9/uQimRO4U5DdZfy5OHCYx6e+VSAPR4ymHWAiOiFc=;
        b=Mh5Ppq+WNz04cuGyEEfg6GKVk191+dP3E4P1ZU32AMCnNP01ioUKpBM8CjHLf0cPV1
         ifbb0uAqv4WDnESLAGNSlRWvH2Si3akVmZvgRhrowvfj/NGjRd3wfvsLUmWHBBImBWWt
         X6gRpVUd2V87alf3KgXhG7OHrAVgqy8WaDbp7hCH6fcZGYeeAb9h+0gv05nS+m02xPpk
         XMjVGB1GzipNfrPlcoAEx/CIgt8ddyH9YB70Y7jlq+C0PfYPcQvwYOe6s5H8tKevJQDR
         Za4LmYPnF5v0ewyDDP5BHlej6fPDTyuMpS9HLH25bymGvES+onpjB0cR8O4eviWrlmdk
         h0GA==
X-Gm-Message-State: AOAM531pw/Oa2SRR/QXo7PXyOZiaMNVnmJBnmZ36s2stUYZBYE2dXjEn
	DLRbf7mDV827S732u9UGce8=
X-Google-Smtp-Source: ABdhPJyiCGW59QHIl7TaXuJn+iXBBjkYu4OgfUAwdBNc3X9SDa9676AKvhMF8dkYwjmEhbT8AzGJTw==
X-Received: by 2002:a17:902:e746:: with SMTP id p6mr13199995plf.78.1643472345817;
        Sat, 29 Jan 2022 08:05:45 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id t9sm5672868pjg.44.2022.01.29.08.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:05:45 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/23] staging: r8188eu: remove unneeded variable in rtw_wx_get_enc
Date: Sat, 29 Jan 2022 21:34:08 +0530
Message-Id: <e31a2b15673497cbd70bf62b0093f46952cc7596.1643466748.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643466748.git.abdun.nihaal@gmail.com>
References: <cover.1643466748.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unneeded return variable that is initialized to 0 and not
assigned after.

Found using Coccinelle
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 3a60e1f81592..f99942417a71 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1717,7 +1717,7 @@ static int rtw_wx_get_enc(struct net_device *dev,
 			    struct iw_request_info *info,
 			    union iwreq_data *wrqu, char *keybuf)
 {
-	uint key, ret = 0;
+	uint key;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct iw_point *erq = &wrqu->encoding;
 	struct	mlme_priv	*pmlmepriv = &padapter->mlmepriv;
@@ -1778,7 +1778,7 @@ static int rtw_wx_get_enc(struct net_device *dev,
 	}
 
 
-	return ret;
+	return 0;
 }
 
 static int rtw_wx_get_power(struct net_device *dev,
-- 
2.34.1

