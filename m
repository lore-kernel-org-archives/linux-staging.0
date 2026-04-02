Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877B6388E69
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119298; cv=none; b=aD649zBTMoYqGjAQT9dy7uV8zzNjuHGkK9YSvItWu/V7ozJxYehGMzEE4asZ0sWCSVwuCBuZu+i3yZL6O9v9W0cqNANjejycjbX+MZfEFwQ9wfTb5r4yNZm3pcOsiKcSsdAl6U01gLPkroGXkHTGjBa5ODdnZfZlz/7i7PviD0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119298; c=relaxed/simple;
	bh=ANqb5i1tpKDfgmY9Mdfmivntv7t3ODNAUIQtD3WHX88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF7J+tKLNeQMUCDBIJD+HVLzgD3EBSaErett11N5rUMVWcM0fDcvwxMA5koSqZK+IwFS+wL9l+r7Wqy92d9rCwPeocWfLtv9gST4wHm4vzHatLjTMPobz/e1En9/L1q/hvSQmrzQmaZ9La9gQbRH4Kk7WMl8gom0DcLqeIZBXkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMZoPcGF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMZoPcGF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so342983f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775119296; x=1775724096; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Eo+AVSMDc66CklTGyClArKPHGKdA4dAsAoQ34cPyIw=;
        b=IMZoPcGFGmg8dEh7NO8HxXM9eXhHJh251x31/U0bi+X3nwX6RghnpVIlpN1dZZoUeM
         BOL7dSUGmBtKhhdh3B70HS06tV7rQPT2Vq1BGfqUEEuUY5HZKTwMuYbcpnb0OQSdeEWQ
         x3H4rYNzGF2JSQX/G1aT0UeUXef3OtKrdvu9VfSnGTbBO788YNXsw6F3oc3tjn5Jhw/P
         II45BH4Ay6HBGGR2XuqU1Dj796BCnpCNGKgUfaSQEZbdhe7CM7Ux32KTThrLax+sJuYT
         Mnj5wZRxnhl1Vo1UsQM6vAhmstj5fQr2xFlptV6LycXWDdfopD3eRJyJJbyV0F4EyOdF
         4ebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119296; x=1775724096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Eo+AVSMDc66CklTGyClArKPHGKdA4dAsAoQ34cPyIw=;
        b=UHQIoCaeXs2dGomPz6XV4LbZutEBJuwCLtzphIpllJWTD2ydA54yGgtckjiB5rm6Dt
         GHBWrn0C/9RYPSrTQcS8aIIypn/GsMsf+d3mfnrIMmVOnwlXuTx27T6L5U9tznlS8lFX
         u3BX712eMAVgXORqxoHHf5IDgFDfTuAZP4ol4es3/w/KvRshxSdpevnmQuKoV2QeQBEz
         rirkpB9UOcNgllSSRiV7gqKSMP6rYnThww2lis9Idk6wa7NhyIyaLKKWPwxOBTxUoGYD
         cLbXOm+iJx3ebdK4xBLC9CpP9Sc3OwYKruuXRWTdk+a9FQyg+Ihv+FbYzRECpYRN13Ex
         lcmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWydHW0UFEwWR2tCFDzHV8Dtk+BgHMfQs55LF85gHJGG6s+9WBP5+FKQlvZL2dpnoeMhh0dBpaiSo7JBWcF@lists.linux.dev
X-Gm-Message-State: AOJu0YxmtphmupJln19QAn6mmrK6ywQf42RRVjUN2S2BPzPqkI5diPn+
	E66FWpQW0aV8OAm1gBw4Svp6NmHxwOPRxUWF0hdSb/iEGaAqlVydr9s4
X-Gm-Gg: ATEYQzyQ9fQIa92X6qnwAfNdFjigLVDRLqzi2smjyl8260PzH41lKniKdSB5BfLCpS6
	ySQLUyZqUKEIxpWaKu7KjkrMvxZYDIieV5MZ+x/RZjabZ/M6U9tXIQr2kV90Ai6CFLjQdMJDOsh
	yXq9J72kU5jAKwSyFSvD/TtymT+2Yq/Vo4tjVtGo7oif53Kr3HIL0Swz/6Saa8sE9jiVO6C9fLq
	STohNyOreHSIvZzJLUDKBYE2KO9pEmqozKM69v7S1u/QueMbtNNYA5xf2uD2m7SoD51oaIPmsKT
	CZzFigH+GFeC8Cq5yhi3GY17nZg1hP52LNpMEgOyvMp8+ZBLJzUzcJFdIIsVLJaFVEqToGkNfBA
	Jkg21z2xaWXZAbgN9729zZqEOGBtL66EN3YhEb+dUp8/0WxsscWt6SjCtQ75Z+AEWMUyBjeOIYE
	Y+wK7AOZXsCSwqrHUTew0=
X-Received: by 2002:a05:6000:240b:b0:439:bcc2:bf0a with SMTP id ffacd0b85a97d-43d1f234bc9mr4271590f8f.23.1775119295773;
        Thu, 02 Apr 2026 01:41:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm6432694f8f.21.2026.04.02.01.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:41:34 -0700 (PDT)
Date: Thu, 2 Apr 2026 11:41:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yuho Choi <yqc5929@psu.edu>
Subject: Re: [PATCH v3] media: atomisp: gc2235: fix UAF and memory leak
Message-ID: <ac4rukwPFO0nwlzL@stanley.mountain>
References: <20260401163050.34830-1-yqc5929@psu.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401163050.34830-1-yqc5929@psu.edu>

Please run your patches through checkpatch.pl.

On Wed, Apr 01, 2026 at 12:30:50PM -0400, Yuho Choi wrote:
> gc2235_probe() handles its error paths incorrectly.
> 
> If media_entity_pads_init() fails, gc2235_remove() is called, which
> tears down the subdev and frees dev, but then still falls through to
> atomisp_register_i2c_module(). This results in use-after-free.
> 
> If atomisp_register_i2c_module() fails, the media entity and control
> handler are left initialized and dev is leaked.
> 
> gc2235_remove() is the full teardown path for a successfully probed
> device; it unconditionally assumes a fully-initialized device.
> gc2235_probe() must unwind only the resources that were actually
> initialized at the point of failure.

The "must unwind only the resources that were actually initialized at
the point of failure." phrasing is too strong. I was hoping you would
review it and find an actual bug.  I reviewed it myself and didn't find
a bug beyond the leaks and use after frees mentioned in this commit
message.  As I wrote in my blog, leaks are one of the common bugs from
this style of error handling because it is too complicated.

> 
> Handle each failure path with explicit unwind labels that free only
> what has been initialized. Return success only after the full probe
> sequence completes.

If I were determined to use a magical cleanup function to do the cleanups
then I would reverse the gotos and direct returns.

regards,
dan carpenter

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..61fb82b26cc9 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -808,8 +808,11 @@ static int gc2235_probe(struct i2c_client *client)
 					   atomisp_bayer_order_grbg);
 
 	ret = gc2235_s_config(&dev->sd, client->irq, gcpdev);
-	if (ret)
-		goto out_free;
+	if (ret) {
+		v4l2_device_unregister_subdev(&dev->sd);
+		kfree(dev);
+		return ret;
+	}
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
@@ -818,18 +821,16 @@ static int gc2235_probe(struct i2c_client *client)
 	ret =
 	    v4l2_ctrl_handler_init(&dev->ctrl_handler,
 				   ARRAY_SIZE(gc2235_controls));
-	if (ret) {
-		gc2235_remove(client);
-		return ret;
-	}
+	if (ret)
+		goto err_remove;
 
 	for (i = 0; i < ARRAY_SIZE(gc2235_controls); i++)
 		v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls[i],
 				     NULL);
 
 	if (dev->ctrl_handler.error) {
-		gc2235_remove(client);
-		return dev->ctrl_handler.error;
+		ret = dev->ctrl_handler.error;
+		goto err_remove;
 	}
 
 	/* Use same lock for controls as for everything else. */
@@ -838,14 +839,16 @@ static int gc2235_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
 	if (ret)
-		gc2235_remove(client);
+		goto err_remove;
 
-	return atomisp_register_i2c_module(&dev->sd, gcpdev);
+	ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
+	if (ret)
+		goto err_remove;
 
-out_free:
-	v4l2_device_unregister_subdev(&dev->sd);
-	kfree(dev);
+	return 0;
 
+err_remove:
+	gc2235_remove(client);
 	return ret;
 }
 
