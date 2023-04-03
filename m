Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A156FA1;
	Mon,  3 Apr 2023 15:23:09 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id v1so29755664wrv.1;
        Mon, 03 Apr 2023 08:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680535387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aTzkLYbvfd2IjRZTFEqIenxLEq+ZjYmO48DPd7DLZEY=;
        b=G/Pda6VDK6CxGQSeSiPCjP+S24TJAX3Dk5+qGro8GNMocnUHuA1ITVKwywe21C5HZ7
         BESY7KJmZeWGxvOiIkcexgYYe30hSBzTlwgAN8o1/RAw0tLS5N7FLOirAFLszZcqLGl1
         CwuiLVeC+RO+KLy33iEYBdVr+oDSxoxm0vh+f219Xp1IcVHRFeC3XocRX5h/gDSYIjtI
         b2EF8E1pP7XBplWfwKAwhI+4YALVOxcVL4siHkV/ujRLQwvYLbawMIDMnrXM0MRDjWJh
         rrvkgHAWGLTfKWyV/ZR9fPL9645FfkiJlty1QZ3DTHj9KOj7DWAUvHXE6sJ5LwLxFT8Z
         BPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680535387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTzkLYbvfd2IjRZTFEqIenxLEq+ZjYmO48DPd7DLZEY=;
        b=x1hNNN1NXBNYx2WmZtkTRoLS8OTelVsa1PI8QUnFnFZ3LdMgF68hkQQGlGsAdX5UMB
         1HClQL6uXk5cXVMVOnInfM9b8c2Ys4tztNFCTgejrVhYBwwZYc99koN/QT/sHsm2kEks
         VjnNbQDEHjESFBMsYv7Ou+40oMhxNVrB+dU0T4fyTLnHjs37NQ+K3BLHpl1yDIvmJw21
         fClNLuMoSTpH5D0goJux3IpOGnO/mtzHvHCUGERwvt3prhW/svpKi1jfBZa2HOw8feac
         a5cjMEbpIEXj76O0PT+n3hokBu3jUjsN4o3eQmltIqEG9V7buwRlVtiSDBLhR+njh/q7
         Aa1g==
X-Gm-Message-State: AAQBX9eZiA5iHw+E1JY+fEmMSN7uJy0R8/W7DcqIm3iNvXx1oXJDtofU
	G+WcRvTZo5Ak6SoHH18VnkY=
X-Google-Smtp-Source: AKy350bqYjtBj10U3WWxA1pDD+RJFNIqqC8vJ90OuKimssYnRw8/Viy514sQo53q4o6IlyeMdTEtfQ==
X-Received: by 2002:adf:fccc:0:b0:2cf:e868:f789 with SMTP id f12-20020adffccc000000b002cfe868f789mr26500082wrs.48.1680535387234;
        Mon, 03 Apr 2023 08:23:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p6-20020a5d6386000000b002e558f1c45fsm9870405wru.69.2023.04.03.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 08:23:06 -0700 (PDT)
Date: Mon, 3 Apr 2023 18:23:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alison Schofield <alison.schofield@intel.com>
Subject: Re: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
Message-ID: <02031cc0-c035-4171-89d2-6e53a5c3d6d8@kili.mountain>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
 <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
 <ZChs5jB7DMCUnVzr@khadija-virtual-machine>
 <9688d93f-5ece-4799-898d-98515a98f9be@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9688d93f-5ece-4799-898d-98515a98f9be@kili.mountain>

On Mon, Apr 03, 2023 at 07:29:36AM +0300, Dan Carpenter wrote:
> > > This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
> > > we going to be in COLDBOOT if we are in INIT?  Is this changing in the
> > > background?  Can this check be removed?

It turned out the answer was yes, it can be removed.

> Also if stuff is changing in the background and there is no way the
> locking is correct.

The locking is correct.  Take a look at it.

We are holding the &arche_pdata->wake_lock in arche_platform_wd_irq()
and every place that calls arche_platform_set_wake_detect_state() takes
that lock first.  So it can't change in the background.

Delete the check like so.

regards,
dan carpenter

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..4cca45ee70b3 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -172,18 +172,11 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				arche_platform_set_wake_detect_state(arche_pdata,
 								     WD_STATE_IDLE);
 			} else {
-				/*
-				 * Check we are not in middle of irq thread
-				 * already
-				 */
-				if (arche_pdata->wake_detect_state !=
-						WD_STATE_COLDBOOT_START) {
-					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(&arche_pdata->wake_lock,
-							       flags);
-					return IRQ_WAKE_THREAD;
-				}
+				arche_platform_set_wake_detect_state(arche_pdata,
+								     WD_STATE_COLDBOOT_TRIG);
+				spin_unlock_irqrestore(&arche_pdata->wake_lock,
+						       flags);
+				return IRQ_WAKE_THREAD;
 			}
 		}
 	} else {
