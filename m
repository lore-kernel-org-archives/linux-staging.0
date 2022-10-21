Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B46130;
	Fri, 21 Oct 2022 19:56:30 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 204so3539006pfx.10;
        Fri, 21 Oct 2022 12:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q87+XlhQn6Tk3P1abcoeuNg9gQxaeIvmWYCmU3ZSX0w=;
        b=e0zwMkMHKkJlf9+RGMoru+W87WKCq8xNa/1hVwEGzJNTqSO4gA+72IUm5X5QYaw4MM
         b0Y+4xDS3CNIkcjZ8/BIx4pdqJLd/pkGg/9yFM6OHJM1GpHcnTot1+qXayEyKHlbsm58
         EoXGJQpLzjqk1QVmnD6Fj1HCWVfh00PkxEHQgmwlaEpsuj4ZEzpWI10ABgOU6K0pU/1D
         Ou6ya4V2MWr8B9lmN+L1JX5guAf9zwwOsp7iV0L7UhUOiGO2LVuPSIdcN6eJaEfgkgJS
         SvTdNBi1rYpn8pHHOvbMdTllC7bPVYrOVq7d92/Nst74zo4lMTSorzbbNTnRGthdd//t
         5J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q87+XlhQn6Tk3P1abcoeuNg9gQxaeIvmWYCmU3ZSX0w=;
        b=bSiIRjxQz9CoI9hRNjHeqJdc4OxH8qn+9dF2xGsJCBJJEJzbHDFbsdbhSogNKpUY2g
         SXeBCj+YAZ+1ZJrzICo5Zzb+7r/cBjcaI08FtJ6C/bjH6ft52CEo8eMar1iO4Ftpgrle
         oxZ5rI63wYZfBEJZ/6ijI24eQwOdtsi3cApz5qWC+EJ0cbyVi7R1tnsmh60CvIYuWNlX
         hrSQuEV95hFI64EoJ7swSENrZ74y7UDSG80wprCJXuFhO4dH23vF13/UUYXuv/W3XOqg
         hrorh9ZiIILDRNtzPp/tXmCtrno3AwumXABHgwkzFLDG5ws50CzMGg8JSPjxbX+9zQxz
         Zphg==
X-Gm-Message-State: ACrzQf07M/lYelbvLduBWQbl1dWS2j6g1jBDK2ODGQeZNQGQ4ZnJZH72
	avVy7oi7ubIIGaNjtZMyXfo3yR3E947hpg==
X-Google-Smtp-Source: AMsMyM4xqb6gSapkyekAI3xQRGN8PuvNIv5AfbBFdOkanjUQMGgYGMON0kG502mfjhXtN+OO3+rvkA==
X-Received: by 2002:a65:6d1a:0:b0:3fb:2109:7b87 with SMTP id bf26-20020a656d1a000000b003fb21097b87mr17299819pgb.127.1666382190589;
        Fri, 21 Oct 2022 12:56:30 -0700 (PDT)
Received: from localhost.localdomain (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id g13-20020aa79dcd000000b005668b26ade0sm15179345pfq.136.2022.10.21.12.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 12:56:30 -0700 (PDT)
From: Emily Peri <eperi1024@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Emily Peri <eperi1024@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: use tab instead of spaces for indent
Date: Fri, 21 Oct 2022 12:54:57 -0700
Message-Id: <0516cac046c617b55718fddb2aac3a50d543d84c.1666380274.git.eperi1024@gmail.com>
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

Replace spaces with tab for indent and correct alignment for closing
brace in rtw_ioctl_set. Issue found by checkpatch.

Signed-off-by: Emily Peri <eperi1024@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 47323160e72d..3b44f0dd5b0a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -312,7 +312,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
 				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
-	       }
+		}
 
 		*pold_state = networktype;
 
-- 
2.34.1

