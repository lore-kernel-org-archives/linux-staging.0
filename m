Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ED071
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 20:06:45 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso1770168pji.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 13:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=GMg/FFR0ECC47+tfo5vkmf+ZSs0QnHlqZW6AgseZadw=;
        b=lN+dORtkNG9cCkyJSGFHpXAsiz/Q6/h+13fjotQ6LWYeLUUHC5GeustujfD6HgNxNw
         nzdmPyx4NTcLGw1nuFacO2WCG1ykHJJTf0qUgxahC8Czw2gbcWBNNlARBl+gpag+hERD
         /wM+pxztUDyQ7YxNwqXM53vyoPa/Iyw0br2ftrXCVyHL7dPs0gtWflqIrSGb57TCjz2U
         FFBQBiKJ+J2SSALq1e518H43gFqIlNvIs4tDyQb/JHmiPBQUOi7vkDwAVCkE8TEKhpYH
         yBqzsokASb23RcFuvX/5wuvG1qgSsui2427xkHMg570wnxL6k5lrdu+UFRMOXx8Nk75h
         JOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=GMg/FFR0ECC47+tfo5vkmf+ZSs0QnHlqZW6AgseZadw=;
        b=FdHQcWxeHLyn/03yaR9WGBN+tLuthItuE8y21Yv8HAUDv19JYVzrFYhFKAm/uWdcl+
         pD1KadCUIr9i4qpD3K0UzwpVyTDcjOnJF1UAqub5XI6y69rpoCOj+Kjs949WvDmh2ZJz
         YdbqWEHRfbe/AZg5RjnUAaksNGKGe6W8BxFg3cYFGuly06rV4sBf9nJQ7D4azN3p/QEG
         +NAlZrbO063Pubv6ysuWXSVRoye7j/YvbyFRmFnqY66ybXvXiNgwps1v1bsq9RIDMDCR
         9khlFEn3qtTzY3rb7mSQBNvonIkqZGjvnnqH9dBU7e3pjJ9sjPnRu8MLT6YBZWoc97ZE
         0XfQ==
X-Gm-Message-State: AOAM530ep/gsWCPy/d3eUcQk1qQf/XVVGt+fvdbe+Bmp1L58SwKZ/cCj
	ptiJ061udX58aD+DA+vPO+w=
X-Google-Smtp-Source: ABdhPJyJQO9W5tM367fuFnr/0aBXWfAqS/iM0S2VBhpLiss3WR80o/HPlzj7rt4I8RvRKpaW/ogd/w==
X-Received: by 2002:a17:90b:38f:: with SMTP id ga15mr4994722pjb.149.1617221205384;
        Wed, 31 Mar 2021 13:06:45 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id d22sm2985668pjx.24.2021.03.31.13.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 13:06:45 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	phil@philpotter.co.uk,
	amarjargal16@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: core: remove empty comment
Date: Wed, 31 Mar 2021 13:05:37 -0700
Message-Id: <f6be2f84ff5b29a51ca6be0d269c50d54568b2e2.1617221075.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617221075.git.deborahbrouwer3563@gmail.com>
References: <cover.1617221075.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1617221075.git.deborahbrouwer3563@gmail.com>
References: <cover.1617221075.git.deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Remove empty comment instead of fixing the checkpatch warning that it was
generating.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 428c71ce0334..7b4c0f22cd90 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -876,8 +876,6 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 					*(payload+curfragnum), *(payload+curfragnum+1), *(payload+curfragnum+2), *(payload+curfragnum+3),
 					*(payload+curfragnum+4), *(payload+curfragnum+5), *(payload+curfragnum+6), *(payload+curfragnum+7)));
 			}
-/*
-*/
 	}
 	return _SUCCESS;
 }
-- 
2.17.1

