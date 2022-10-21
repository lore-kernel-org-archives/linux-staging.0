Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E286130;
	Fri, 21 Oct 2022 19:56:22 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id f140so3582336pfa.1;
        Fri, 21 Oct 2022 12:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVHR6st+fnyvZfjMvAocuNZtpc8eTVDV7jE2UDAUQUc=;
        b=LYzsRGKsbb/1ZyylXufuI8XNEppsOHrZaOGd72JjdthErF1TPZdgL/2giRc9ZrNTv7
         jyJmuvvoMsx2yDczM25IJe1bUlAcu04wHUKQFndcVXynBFJ2SJsXJCToRG0TXsnBcWwX
         hxbywQ+LEUSm9IAH9TWe1FVSFXmTA4tTsshvJgTGDIIVEjFCZdvRx2DZ1Wf1yIUt7ysj
         ciwbq5kVbWfdgXzzjjDSJIBu5ASdC8rubjBZ5JWuapW02MoYNx4QsMODQw9BM+EYGA5q
         4LItOYl5QIb+8fh/0vkd00zvIP5Xm/6c7K/SdPKao+fG9bxH1p+ake6zLSasa6hq7DFK
         AEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVHR6st+fnyvZfjMvAocuNZtpc8eTVDV7jE2UDAUQUc=;
        b=uItwieEeOTEHel6cMNPnIxfAhKOpSYtJ0Ppo6qkfQjaA45Y1lEkn1CcOAyjBBuNyKv
         RanyNpNKAatB2tqv9ujieEojjQ0ezVJU3fySn86CyabUkvB6GcjsH+8X729Glsqgdo7R
         lpF9BEtceRAHhoZQC3vXwsV7SS7uLNj/iWB7yHVVYraiT715ZLawOApQLsPzafjBeKqB
         eMErGdeBR7ssj20pY4kooJ058DxN0PqC8tQGk968f2XO2r8B4jEyCwiVM+7crX9kQQPF
         1c+EimPwIyfXb5MqU/xy3AB0KVVQqiPhjGZoH4CU9measoUhtIZyYP8yCVGomLaAWufF
         wkrA==
X-Gm-Message-State: ACrzQf1gbS9CLsVDr31RYYCBasipnY1oUQDHB9HWONB5okluXXtpCt8e
	sNh4vghpXTbfbdpcEDb3+q8=
X-Google-Smtp-Source: AMsMyM7wtVtAENJMy0zwI6HAc0B7xm4IVcTdnVNBA1HZdGetCkDdmAjmdj4DlG8jdHsjUTCCKdYNdA==
X-Received: by 2002:a63:8141:0:b0:460:5be4:f6a9 with SMTP id t62-20020a638141000000b004605be4f6a9mr17366703pgd.368.1666382182549;
        Fri, 21 Oct 2022 12:56:22 -0700 (PDT)
Received: from localhost.localdomain (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id g13-20020aa79dcd000000b005668b26ade0sm15179345pfq.136.2022.10.21.12.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 12:56:21 -0700 (PDT)
From: Emily Peri <eperi1024@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Emily Peri <eperi1024@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: remove tab in variable definition
Date: Fri, 21 Oct 2022 12:54:55 -0700
Message-Id: <ee1bcccb23b3d24eb87d0b08bfa817b4af692dc5.1666380274.git.eperi1024@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666380274.git.eperi1024@gmail.com>
References: <cover.1666380274.git.eperi1024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary tab in variable definition in rtw_ioctl_set. Issue
found by checkpatch.

Signed-off-by: Emily Peri <eperi1024@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 8c7daab141db..ede7d2930844 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -367,7 +367,7 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 
 u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_ssid *pssid, int ssid_max_num)
 {
-	struct	mlme_priv 	*pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 res = true;
 
 	if (!padapter) {
-- 
2.34.1

