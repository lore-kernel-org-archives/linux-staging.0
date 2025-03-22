Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007B77080D;
	Sat, 22 Mar 2025 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742657838; cv=none; b=MX0y/PqA6gWFAsTbzvwatSV02BjvPrC/HjhupjxAm8nPvFd2DelD4pROJAdECvj8w+T+ixO2MqAEh+34wQerq17kPuufllCy2l+HDb5wkRCFb/2Dz27DbgDFq0J6Ju/YMwe7QYZPo9AKO0+z2RRUZXQ3A6CV04oDaVSayv6y4Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742657838; c=relaxed/simple;
	bh=/T8vDis5wt1e8gSA9CFxhWdIs6vxuC+8XJ8OzBDc8JY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dc4gR1IHKLR/lijw9q1NOx7lupeFVJCCpxRKMhBIPBhPoixjMDRLfLvu+I4Q+ei7eK6fE0Paj6my3mLD1NJyJkNZLqqfYO/7EcO0aisZrQyplnYLwLYAt5dTUYi9HTExNc10eOI4ZqNZ5fJBYlDD8dvLKQI/eT3PaQE81pi+b2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDarWXeA; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDarWXeA"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac3b12e8518so651619066b.0;
        Sat, 22 Mar 2025 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742657835; x=1743262635; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDPcWgMNo2FqmuOqa9TlGd/nusehsLtSUTJAhoCLfx8=;
        b=hDarWXeACxlIzKZTDm//Zpig3II8GZj6MP9v45m4lHat9jOb3e/trKzGa9cm/iH4Qu
         an3+4OXKCyQmiqyEJTzhxcIlxSGjDnorO2NItM7aWS7KYEdysNUTT5V9lDmwGX1saBbU
         Rnrtrtv8cWlePBL6SZR4KPY5I1SkqsuQsh3UYe446PrK4l73wGGYpUkzPGVOTkUF4mQq
         UEd/njiTlP9YJ25HrBsBo+Ynw/WvPlg91gEr7zna1H/66SgbMIK9m+LFhju5Vho2p4qn
         s6MYtpHWQKeFSLwfwclht56RxAP9VCTeCrIoalQqXxGG6bsYg4+/ZNSh67WVfrlrT6Ma
         liOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742657835; x=1743262635;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDPcWgMNo2FqmuOqa9TlGd/nusehsLtSUTJAhoCLfx8=;
        b=Z8wTxq1PsVlbU/uiaQwSHfiFlysEpG2ryXbHli0mDsd4YjQOYRdV997VW7Uf/UfvUO
         RImoblV+pS2kmmRqiTrMxcAmnLzOjQeohR4MZ6IMURUEeKlkZSZpkTAjGdQeRLV6rzul
         tWwd6fpDKPcMm9mcuDenfQ9Bws7N6RNueKMwQ/51enavklMVwSOPyC3d4ImrIAjB4gKM
         TrGSvuBUXwFAuYqtrxb/+TAdVx+D2+fch8bngWCHGYeb6LkvIhvL+MdGhpID0ahDvk+P
         RpdrdkgIQvKEiQ5luCkweaoXlpramJ/IwslRcRsEja1dmGIyR5j9IxfTr7EXbxy3e0LB
         5GiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRa5FkYDFDCDGfTN+HX4VuA9tp9gq5IepA461lq6/rAXkN0LKK8el888WfI/Qga4imFw2NzBc2MatIoVAV@lists.linux.dev, AJvYcCXlPPxclKpCaR+Kbl7au8MkbLL0JgjE/BFyiEKIBeKzGUcBuiPOZfVjOGs3tIA2z+BLv1f0A405Qt/j@lists.linux.dev
X-Gm-Message-State: AOJu0Yxle+XVGmLzXskwCHjON7RhLIrdnw6owiAK825XoL+Hy/DCtck/
	NnWk3b04DK166/vtsM8BLVChiSqU/pvbbkWOrAOZt9/Oa/IzVGbT
X-Gm-Gg: ASbGnctpU1E9yCyoTbjvxL8nfiXHgPLc2DKur0SjgWqMsLoF307rHN/ZkjeomhopqSt
	JnXQJ9pT61daNxok6OPF4Ne5m9stNEmijA+waAwIvrkn91Lx7JwKfghAzYPwHdbVGcshCfOJcHW
	TnZeJ9kysLy45GdQTKyLNJqPAydGkoNOyneBLtUpULaUwmAJblpYtJcFFfxFbxtQyi6CAEd3YIX
	AlAQ6V10DsTozrp3vJWMfzOBe4HeWqYrEqcHNotULryMlJ6168OK/eD4I7EZVu0YBUcROQ8K4ui
	wRTE/irGhK6ZrsITG48b7bENwSvBl3K+GvdDjztANsakv0Z+Bw==
X-Google-Smtp-Source: AGHT+IFkSEzUgBZ0q29OnEgwaAmNJN8Y3mUH0OvKhoqlOBRCbzI4wzIkN6km6zh3cBkvJW4Gi+rwRw==
X-Received: by 2002:a17:907:9403:b0:ac3:154e:1391 with SMTP id a640c23a62f3a-ac3f207f927mr779803966b.10.1742657834898;
        Sat, 22 Mar 2025 08:37:14 -0700 (PDT)
Received: from HP-650 ([105.112.226.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3cd3sm363834466b.40.2025.03.22.08.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 08:37:14 -0700 (PDT)
Date: Sat, 22 Mar 2025 16:36:53 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: bcm2835-camera: Modify function call formatting
Message-ID: <Z97ZFURPvDcTkjjf@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The line is a function call which ends with an opening parenthesis
thereby not adhering to the Linux kernel coding style.

Modify the function call to include parameters on the same line as
the opening parenthesis to improve readability and consistency while
adhering to Linux coding styles.

Reported by checkpatch:

CHECK: Lines should not end with '('

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v2:
	- Add more patch recipients.

 .../vc04_services/bcm2835-camera/controls.c        | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index 6bce45925bf1..e670226f1edf 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -533,17 +533,15 @@ static int ctrl_set_image_effect(struct bcm2835_mmal_dev *dev,

 		control = &dev->component[COMP_CAMERA]->control;

-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
-				&imagefx, sizeof(imagefx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance, control,
+						    MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
+						    &imagefx, sizeof(imagefx));
 		if (ret)
 			goto exit;

-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_COLOUR_EFFECT,
-				&dev->colourfx, sizeof(dev->colourfx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance, control,
+						    MMAL_PARAMETER_COLOUR_EFFECT,
+						    &dev->colourfx, sizeof(dev->colourfx));
 	}

 exit:
--
2.34.1

