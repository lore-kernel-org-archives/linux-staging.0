Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68FD1847
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 01:07:19 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id bg21-20020a05600c3c9500b0035283e7a012so537559wmb.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 17:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZzQCy/MScj+BTuPjhtqug3TSbF4CNKXkcyvV0JhfwZc=;
        b=sqhGtmBlziqPD1tj7I2PX56c4g/RoEL5vCbgrFg0DPE2HaYyd2ZXJf4cBYA5Z5JwbB
         aJ/TOkzkqojw7KiIcvJQOG+XMaWEsbGNufK1XmbBgHt5PjeKj5ZV5gmGY3KqeLoYe8D6
         16f1zrS/OgsoE4cExkWRnyMa3nx7x2HQlyqnGkz/STp5zKu6llAXXUc2OXXbC2wXqj0o
         NOwS27Nw8Xqu8xc73KF7CrCwdEIkgK+hDr2zbpgoeF9TICHmF0h7AL0nhpH/TK6AqBql
         EYvsIrU0BtDGJoQRqyjI7JYPU52ZUbOOa/vwgyPiSwp8A34UAC/iOJwWt9mJLJuVxWLq
         fLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZzQCy/MScj+BTuPjhtqug3TSbF4CNKXkcyvV0JhfwZc=;
        b=4GBnzcYnKNbgZH9GlABETH0T3HgyjlExU+zv1uYj9C+PPKwgpHqnhcVDpYJrc4Q05W
         xNMtdJpok2B9ABWazw46lPGEqwUykubCqw1VOb0mN3z7oey5qgLd/Pj955Fby+FWDgpE
         k9m/7y24AEfcbGMzKh/R33BDPzKW/bfdYDsKEJWn7h22/1BmulEvg4QKr21AdcNvq4kO
         xNOu3Oavoz1qnqF32vv7INxyvRxexuJDfGHRiakUQK9gLkVxLi6e0+KSgZOGhJwEoiGR
         tHCVdrRoxtjqpPOuYjn6DIGWiIjboPEqCaQUuOGgHCNaaifC4kVJOcnU2fekEVKRgQgX
         VUCg==
X-Gm-Message-State: AOAM5333o9uynDrXvtshgddJHag1+thZ20iWasYqlWypQpTvodUCiDf8
	qd3OreZQlsxJcNZHI3tGnNhkA0YsNY+hTbrR
X-Google-Smtp-Source: ABdhPJzDEi7e/QTeHgAKRG/LE4zW9YE81YXknKB2ghGP2WKspBHwBJjp4If9F8ErjFF08+O1ttR22g==
X-Received: by 2002:a7b:cb98:0:b0:37b:dd98:f87c with SMTP id m24-20020a7bcb98000000b0037bdd98f87cmr5092364wmi.59.1644973638069;
        Tue, 15 Feb 2022 17:07:18 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id m8sm10551185wms.4.2022.02.15.17.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 17:07:17 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: [PATCH v2 08/15] staging: r8188eu: remove remaining DBG_88E call from include/usb_ops.h
Date: Wed, 16 Feb 2022 01:07:02 +0000
Message-Id: <20220216010709.791-9-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216010709.791-1-phil@philpotter.co.uk>
References: <20220216010709.791-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the one remaining DBG_88E call from include/usb_ops.h. After
some thought, it makes more sense to just entirely strip all of these
calls, so that debugging code in the driver can be more consistent and
useful going forwards.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/usb_ops.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index 62e4706c0497..edef3ad1ccd9 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -31,8 +31,6 @@ static inline int rtw_inc_and_chk_continual_urb_error(struct dvobj_priv *dvobj)
 	int value;
 	value = atomic_inc_return(&dvobj->continual_urb_error);
 	if (value > MAX_CONTINUAL_URB_ERR) {
-		DBG_88E("[dvobj:%p][ERROR] continual_urb_error:%d > %d\n",
-			dvobj, value, MAX_CONTINUAL_URB_ERR);
 		ret = true;
 	}
 	return ret;
-- 
2.34.1

