Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299AB72
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 08:17:43 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id p6so12244105wrn.9
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 01:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IyKB46K3ypu2aXeRH7albc1z58567mfbml07nO1sgOo=;
        b=HS9I2ZyD+DjA11BE75D6pAP4oLe1mmo4yWYDiwgRrBuY8h3XJQRbMsYjE/+Et5NdaP
         YeYVVQXNkGPXPth7tuNiiKui+BAm8Nfyq4vurYWoLJJv6O9KIyLSQNth48TvpAQR+j/Y
         W4jOGMCkCcA7LzgRusWcFUFdhNQ63EDEXTrXxemW2VCNzkmz/z863L/cogV+LbDFS+3s
         V+7zAxRFG0cNUwoTKnNXdgMEEy0gYJuh02tyPj+bkH22clyyOHyiwi9sIRXgCjqRQE7f
         c0JcZG2u4BR1oL6pcvR7wby3auz/l5wOYMccweF/4YHGkV8ciAqVewI7ibA1gVKVC+y0
         u8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IyKB46K3ypu2aXeRH7albc1z58567mfbml07nO1sgOo=;
        b=ISwheNQ1gc8dvLkHgGCSCjF3hYYaLiiLWv9ed9IYSG+n7c/FIVYPAxCwLF9bSvZjx6
         3JRABIpWtuJFrdpPIk6mOnbA2amvFbBp7XDOFr6vyziJwHf+eKnzszup85bEy1TEk18l
         GfyNcrTCYbTItYQ3SHCjLdPnujyQ0MH1cg8pwmCifPZiUIRWw0D0RwdiuNKL6w97at2K
         q62GceJ+35QYpa7bBKUmCdCLuC76RKqLg92LCtsOq2Td8r+6bdg8iwKJmh5Otn5LNO1B
         W6Ly3QXkjrvq2q31SMEL8AP831TdT8ofVPzQ7M8UgFU7GkLEqgO/veNEDvCAfyh7Iwv3
         sRlw==
X-Gm-Message-State: AOAM531GoD0gu8R/UT2r1t8ABY6XCxNj2A007O9Wc02g873JO56tMjqP
	ixGMLCQBNkh6mnkZbnOXmJ0=
X-Google-Smtp-Source: ABdhPJx2/Mvd2ETJCC6X7S3be8bRA59ZG8QpqD20+dWQh+z+jr4JsE19PTDzf5EPsGJs+SioVefGag==
X-Received: by 2002:a5d:5291:: with SMTP id c17mr42232373wrv.110.1618388261701;
        Wed, 14 Apr 2021 01:17:41 -0700 (PDT)
Received: from agape ([5.171.25.35])
        by smtp.gmail.com with ESMTPSA id q10sm770204wmc.31.2021.04.14.01.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:17:41 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix indentation issue introduced by long line split
Date: Wed, 14 Apr 2021 10:17:39 +0200
Message-Id: <20210414081739.2990-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413145712.GH6021@kadam>
References: <20210413145712.GH6021@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix indentation of last line in if condition.

Fixes: af6afdb63f17 (staging: rtl8723bs: split long lines)
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f19a15a3924b..4cdc5802798d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -621,7 +621,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 _issue_probersp:
 		if ((check_fwstate(pmlmepriv, _FW_LINKED) &&
 		     pmlmepriv->cur_network.join_res) ||
-		     check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
+		    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
 			issue_probersp(padapter, get_sa(pframe), is_valid_p2p_probereq);
 	}
 
-- 
2.20.1

