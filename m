Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D699C959;
	Thu, 23 Mar 2023 19:51:36 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id t10so2369465edd.12;
        Thu, 23 Mar 2023 12:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679601095;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gkkF864aZS59/wrLTPRII1/9wrsBmF5g69w8PpiScM=;
        b=ZDntVr7hGYS17cMcBRD2/8NnbvON+Hi1QWuvh42GyExWsfuN07qDtZ0LLP0TrhD9uS
         lZNHg6vYXPNhxGE1BSx87OXFANVOSVD9ms7Zkj5IaHPnF8euA5DtFTB2ZMW7o2xZq7ft
         zBWdPjYw8jivP6BTmS/0b7pDCJvqgE1oqyu5Yl0gFzMzdDeHudQ+Ur8KlLem8jD736fA
         o05MV2R+bwhYbyha1T8gZ1lj2bpX/IZQGqC6RySEpBohg8lCtF1GsZOxVSN4CdGleWtP
         9GVyz4+NSDVA5iCboEK81aaVUHpXt2dnhdlfWU1NFub1ky0PoLK0wQD+FYJ8/YgJPzEY
         uYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679601095;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gkkF864aZS59/wrLTPRII1/9wrsBmF5g69w8PpiScM=;
        b=R30IBO9MkIPdhJG/AsHmtP76k1wo9xFo1x7t6k+PcaS9d4FJ2r3F6H7vCN5bdwZf6h
         TJ3/sgDOLVlOmQzQHgcfHZucOVovDss6315wxfOxIBTyuhlDNR4r896GlH4q2c59xdsf
         EvT1PYVPfyUpydWdMqDmWm0ZT+fyMfnos5SMhwNsw9/B9P8W9Vigv+Rawvq6/rJ78+2B
         0Lb80lbjoRaeF8voSWeVTDNGcvpMDrloCPTO3l/JBaiLmlgVo3dd+P6nEhvGobffwh58
         yjlUkj7yWxe1RRBGtSd81mw7565tX+lYXWeEy9HljsiefYgQGWM/JKu4hT6UCVHLDzmo
         ul0A==
X-Gm-Message-State: AAQBX9e+zurbpd+BJtWy+/W2phDubByYSC7kALj9zgfIXBoBkBlPhnLz
	E/rBPotLnscCoQBJD98QKcn+Zubt7wqvHzP/
X-Google-Smtp-Source: AKy350ZumT4pJKPLCEo18Nd347kxtyvr7vACqOLRVSXvIyrVAiJCF8uHCHjiELSF+VZxWwBFDOWj8g==
X-Received: by 2002:a17:906:7109:b0:931:32f5:1f31 with SMTP id x9-20020a170906710900b0093132f51f31mr234075ejj.9.1679601094826;
        Thu, 23 Mar 2023 12:51:34 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id ot9-20020a170906ccc900b009331450d04esm7997236ejb.178.2023.03.23.12.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 12:50:47 -0700 (PDT)
Date: Fri, 24 Mar 2023 00:49:44 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: most: fix line ending with '(' in video/
Message-ID: <ZBytWDocM7XbXkRx@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Splitting function header to multiple lines because of 80 characters per
line limit, results in ending the function call line with '('.
This leads to CHECK reported by checkpatch.pl

Move the function parameters right after the '(' in the function call
line.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---

Changes in v2:
 - Changed the subject name because there was another patch for most/
   with the same name. This was causing confusion.

 drivers/staging/most/video/video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index ffa97ef21ea5..6254a5df2502 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -365,8 +365,7 @@ static const struct video_device comp_videodev_template = {
 
 /**************************************************************************/
 
-static struct most_video_dev *get_comp_dev(
-	struct most_interface *iface, int channel_idx)
+static struct most_video_dev *get_comp_dev(struct most_interface *iface, int channel_idx)
 {
 	struct most_video_dev *mdev;
 	unsigned long flags;
-- 
2.34.1

