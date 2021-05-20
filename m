Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6322FB6
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 12:25:50 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id z17so17452744wrq.7
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iWHHZenPdXEGjTL4o2YmW5+QSRDXwgRTW/XSnJQGVco=;
        b=Wv/FFniBNiTi3NdT00spzpZydJDt/XAfKmCPOCuTPf+PxaznjZQf0u4dBpni3cNQ82
         sbFEKjFWtCu5zDKAldhRr7/OnxynVJaIiY8hwv0kA9QhidUq8dDcnQf1JpDN2Nno/Cqj
         Ai5OXXSMidPQ9wr+XD+wjFR9O6+WOb/1QWEbZz7bRIVFqqOfS3ShXjn5YUnhNWw/4+KB
         xxl3s2vjXFPzkeIarws9UWaIZA+d3JNOXImfqu7QrKnHlbtmdHxoXICSLFstbOkNfnte
         5y9jEJhMdABOX5SQopMZumsmNBvrfYNGkODSbxiwdZOUf07n9E4gSyYoQSWpZiaNXB+v
         eeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iWHHZenPdXEGjTL4o2YmW5+QSRDXwgRTW/XSnJQGVco=;
        b=H5CiLwUpwqrsZECLB1z8Ho30JSN3lA+sfJVfYhpxWlaco5V80XJV8XaoUaqpDF+Cw0
         kBKU8gKCXt3UfFWaqZqP4sneqNVZKy09Cv9GKwZhcgEWOVTF1bWn4ScO40SFfZtSGRsk
         xLrwjVIPZO8bea9jOc97y6LuMuoS6WaEnIU4y8txvHJbghHJR749CUTLTLowXymeBlt9
         D1mcfLwVrVX8pvwMC6Snldlao5/AW+jL/yC1GvlU8NHvylBG1OnpVvLXWCwjW3ztVpiY
         XbCSHGp5ukn+5vd44NbfZgkoVb3tUD9uAOVlMG7CoNeONd487uSZvFcrtaEPsWhIWmEh
         bYYg==
X-Gm-Message-State: AOAM5330CDxB8/oQFKWuvrd+ZlAyve6lGE4tCYWydqm68oI0qQTt97Yn
	7UdlMjJy7/evNu30z5W8QAVqqA==
X-Google-Smtp-Source: ABdhPJwBxKu75VlpsTqLdiKp9VQFXNmc9V8U4BbkTTnCMt8V8X2STFodB9ClocabOvdQHewb1qliKw==
X-Received: by 2002:a5d:5250:: with SMTP id k16mr4015113wrc.211.1621513549344;
        Thu, 20 May 2021 05:25:49 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id i11sm3205643wrq.26.2021.05.20.05.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:25:48 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mori Hess <fmhess@users.sourceforge.net>,
	"J.P. Mellor" <jpmellor@rose-hulman.edu>,
	Herman.Bruyninckx@mech.kuleuven.ac.be,
	Wim.Meeussen@mech.kuleuven.ac.be,
	Klaas.Gadeyne@mech.kuleuven.ac.be,
	Comedi <comedi@comedi.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/6] comedi: drivers: ni_tio: Fix slightly broken kernel-doc and demote others
Date: Thu, 20 May 2021 13:25:35 +0100
Message-Id: <20210520122538.3470259-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520122538.3470259-1-lee.jones@linaro.org>
References: <20210520122538.3470259-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/comedi/drivers/ni_tio.c:1515: warning: Function parameter or member 'counter_dev' not described in 'ni_tio_get_routing'
 drivers/staging/comedi/drivers/ni_tio.c:1515: warning: Function parameter or member 'dest' not described in 'ni_tio_get_routing'
 drivers/staging/comedi/drivers/ni_tio.c:1515: warning: expecting prototype for Retrieves the register value of the current source of the output selector for(). Prototype was for ni_tio_get_routing() instead
 drivers/staging/comedi/drivers/ni_tio.c:1544: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/staging/comedi/drivers/ni_tio.c:1584: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mori Hess <fmhess@users.sourceforge.net>
Cc: "J.P. Mellor" <jpmellor@rose-hulman.edu>
Cc: Herman.Bruyninckx@mech.kuleuven.ac.be
Cc: Wim.Meeussen@mech.kuleuven.ac.be
Cc: Klaas.Gadeyne@mech.kuleuven.ac.be
Cc: Comedi <comedi@comedi.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/comedi/drivers/ni_tio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/comedi/drivers/ni_tio.c b/drivers/comedi/drivers/ni_tio.c
index f6154addaa956..da6826d77e600 100644
--- a/drivers/comedi/drivers/ni_tio.c
+++ b/drivers/comedi/drivers/ni_tio.c
@@ -1501,7 +1501,7 @@ int ni_tio_insn_config(struct comedi_device *dev,
 }
 EXPORT_SYMBOL_GPL(ni_tio_insn_config);
 
-/**
+/*
  * Retrieves the register value of the current source of the output selector for
  * the given destination.
  *
@@ -1541,10 +1541,10 @@ int ni_tio_get_routing(struct ni_gpct_device *counter_dev, unsigned int dest)
 EXPORT_SYMBOL_GPL(ni_tio_get_routing);
 
 /**
- * Sets the register value of the selector MUX for the given destination.
- * @counter_dev:Pointer to general counter device.
- * @destination:Device-global identifier of route destination.
- * @register_value:
+ * ni_tio_set_routing() - Sets the register value of the selector MUX for the given destination.
+ * @counter_dev: Pointer to general counter device.
+ * @dest:        Device-global identifier of route destination.
+ * @reg:
  *		The first several bits of this value should store the desired
  *		value to write to the register.  All other bits are for
  *		transmitting information that modify the mode of the particular
@@ -1580,7 +1580,7 @@ int ni_tio_set_routing(struct ni_gpct_device *counter_dev, unsigned int dest,
 }
 EXPORT_SYMBOL_GPL(ni_tio_set_routing);
 
-/**
+/*
  * Sets the given destination MUX to its default value or disable it.
  *
  * Return: 0 if successful; -EINVAL if terminal is unknown.
-- 
2.31.1

