Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80926D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 14:06:06 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id x11so21430894qkp.11
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qKEfVtOW1ZWQGB/v6pA7J6VXKi4AIZGME3dBy4ukcCw=;
        b=lqCEcd7KTffArrdQS+akvzbdOUYb90ENHl1ioV9CJDjsAjZKI36QN3NHR7QRSSWS3V
         lu06VkZSDZDGRtF8XRir3Spjyj7x/cR/w2V/pWDgYQbDRA6A2+jb4ehBGXSk2PwVFmWD
         HEwGnB93Cu8BQXhjoajimI9rQgzD+YSq7i+n55c18JgWwOj+pgbqozAr/yKbNeLv020n
         p+L1+h4egrk7fbLWbndF+76pUV0ZJbje/7jVIwrRP3bFtP/mA8+p4n9lwByV750vGIuc
         cL+djXU845hlaTd/Jax5SO9RjK79gcLHupkR2MyDRqSOwP5H05Hl8CYlDRSqnFqtZWt9
         56qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qKEfVtOW1ZWQGB/v6pA7J6VXKi4AIZGME3dBy4ukcCw=;
        b=e9yklATGKS75sDDflQS/u18BPydKUOCobHKSW6QYUAcp6Np2WmxC8p3BLzNvQLfnNA
         6lpb/LOuse/5ScyXACKN1zNoeDByWBCO9F7DwNoDtVzFWIo2UzCcYQmPDKaoGlhwtqQc
         m3K6/8NUzFRL5fgR23w2ae7Rl12sGfUzw823iMKXqGg94I4a7za7GOCf8r7aH2F1tHBB
         YK1epJU4p2rx5qaHAKmACNFzSY+f/dpTRLOtrKXtPb4EUAAGIwI2jbKnYxR7mGtztgHR
         hTY+aaRhobHyqlzJpj2a7XW0BI+ek1L9y3oVXkkpAOgPpdE3MZenYzaMhREDbGw3UlYz
         aCRg==
X-Gm-Message-State: AOAM532k8UZXn0HQEFqdbZxXf8vHr/GWvVNI5wvVrMd8QnMLomLOhJZs
	55ul6J3/GDSj1yfnPa41+Vg=
X-Google-Smtp-Source: ABdhPJxPlaT3eZbU5DC/1wqtbc5pl9MzjzBWMI6Z13HYRz72sKQ/2aojdP4IVuch7Msp5ksZTLn1Dw==
X-Received: by 2002:a05:620a:13ca:: with SMTP id g10mr377517qkl.380.1618409165944;
        Wed, 14 Apr 2021 07:06:05 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id o62sm820039qkd.81.2021.04.14.07.06.04
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 07:06:05 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:06:02 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 1/2] staging: media: atomisp: pci: Correct identation in
 block of conditional statements in file atomisp_v4l2.c
Message-ID: <0ef18a36d6905628fa596fd5e0a32fdb9c6a8ada.1618409028.git.alinesantanacordeiro@gmail.com>
References: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Correct identation in block of conditional statements.
The function "v4l2_device_unregister_subdev()" depends on
the results of the macro function "list_for_each_entry_safe()".

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 0295e2e..6d853f4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1178,7 +1178,7 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
 		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
 
 	list_for_each_entry_safe(sd, next, &isp->v4l2_dev.subdevs, list)
-	v4l2_device_unregister_subdev(sd);
+		v4l2_device_unregister_subdev(sd);
 
 	v4l2_device_unregister(&isp->v4l2_dev);
 	media_device_unregister(&isp->media_dev);
-- 
2.7.4

