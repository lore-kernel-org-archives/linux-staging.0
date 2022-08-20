Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ED6320F
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:42 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id s11so9112165edd.13
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qVzfHbu5pGUMMhouEyZrkVnSBIn9SzY5DZdTT7h9U4g=;
        b=AfXZ56h85+QxZ5KoQ2/jNFPLYZV3Lt2RitLHjiRAfa5VhgVuCnSnvhf+mh4Dxu8yBL
         BVdZ8T11N4oSNt6rVgPKep8D2/CW2iyiOr9CkJZc1vZGjgXBAgd4KvJeECccHEFlqO7E
         3jl9JzxDYIKrq5Rp2pMPn9VZg/xdV245vPgZX0JMw9SKmW47KXpPvHG55kNL/lbUbW+y
         2+t/GSkKsOfxzDj2X8oBg+dZcCy1E6CjBTykdiVdZfH7VRUZYPpSvQXqxhvSnR3XxEQi
         GXS4CxX3PJ1izIjxsXiAmvt/ICBSj27S5QFwQixwTjIcT/p8Vcg0RdJLLoiPbV4WvpeN
         8cYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qVzfHbu5pGUMMhouEyZrkVnSBIn9SzY5DZdTT7h9U4g=;
        b=TEJJlr8TwSBh56qDMrpo+vQwRgDOl/WmNe1W5b551DYF/pJ8LRNO3YW6dNXPFVcrn7
         ACONJxNy4csHyhBMf5dMa9nYsegcgIx85jSLfRPUScHqt9uf6/A1I14/oYjIA09SG0eW
         yWhZLWnxuqN9bcBSVDlSuzWTyz0ukm6XV1stE9icqWTJjcxJyHfUREj1pfieWnO0iiVr
         y3NeC89H7kX0v0+pWun6njwL/Dlqs/LAbBzye5vzk4pKR/b3Xy1gpqKHdMEo80TK06Tr
         +6PtU2/9desIxGd+Tzpm4KkcRFkDw7gZySTOrbfSHBN+2BTUvI/VxDm+uxAIMT+S6/MZ
         5ZDw==
X-Gm-Message-State: ACgBeo1+Vn2aHifgxznK0hdFfo3BHULvIFVG4GPtUOhpeMLM3OgwyBWU
	Qaig3GrXQns/n93tNrY6Low=
X-Google-Smtp-Source: AA6agR7O9ui7ABd1AbtCzkkjldF3wv5rwC1rytIM3lPLNFCSZ1xyv8CTpQAaY1mVA/a75M7t8Huijg==
X-Received: by 2002:a05:6402:4312:b0:43d:b9c0:65ee with SMTP id m18-20020a056402431200b0043db9c065eemr10423578edc.205.1661019400934;
        Sat, 20 Aug 2022 11:16:40 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/19] staging: r8188eu: rename rtw_os_xmit_resource_free()
Date: Sat, 20 Aug 2022 20:16:11 +0200
Message-Id: <20220820181623.12497-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_os_xmit_resource_free() was moved from the os_dep
directory. It looks like the driver was originaly written to support
different operating systems. Obviously we do not need an extra 'os'
in the function name that indicates that the function is operating
system specific. Rename it to rtw_xmit_resource_free().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 426bf87a1404..eef1a27e84eb 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -50,8 +50,8 @@ static int rtw_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *px
 	return _SUCCESS;
 }
 
-static void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf,
-				      u32 free_sz)
+static void rtw_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf,
+				   u32 free_sz)
 {
 	usb_free_urb(pxmitbuf->pxmit_urb);
 	kfree(pxmitbuf->pallocated_buf);
@@ -248,7 +248,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	}
 
 	for (i = 0; i < NR_XMITBUFF; i++) {
-		rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
+		rtw_xmit_resource_free(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ));
 		pxmitbuf++;
 	}
 
@@ -258,7 +258,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmit_extbuf;
 	for (i = 0; i < num_xmit_extbuf; i++) {
-		rtw_os_xmit_resource_free(padapter, pxmitbuf, (max_xmit_extbuf_size + XMITBUF_ALIGN_SZ));
+		rtw_xmit_resource_free(padapter, pxmitbuf, (max_xmit_extbuf_size + XMITBUF_ALIGN_SZ));
 		pxmitbuf++;
 	}
 
-- 
2.37.2

