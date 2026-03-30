Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B93AB294
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863357; cv=none; b=evSpAFbbPqvLfYGkb07N0bVUr0fpVDojMA/9B1DEQSBhZN5KPrP/6Cv3Ouq8M6Z2w0zLYJrOQsy7ij3La07phhj39nztT4riSTd+HjitR4UuPYOdE88EQMlIOMa2PobZLMrChG+01Xm1yfg1Ag/I8Ge7tYalCS071FPCLjFOI8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863357; c=relaxed/simple;
	bh=tq4oN7AsTkVPYAUo5oteQclgprod38EBmp/dLhKOQ+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AllUmM24ZqR0E3/+DnQ2H5D6z9I7rOxtoxVeJSAo7jV+Te15fOY+pOujU8M0+uzk4YGdtYs3GoS2iavdQOz7UyxsfGfQrWm9fR9vzY5mibq3usWLQ4gjd0/aynvTiGa2VdsyYyLse/53EKqlDebIVQ0Go8NSuQqsCwJKijxMe/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaMi8Mta; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaMi8Mta"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso34145835e9.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 02:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863354; x=1775468154; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dw3GlJzRigow5MEAZRBZ9gfDU7AZvtgosUcNlmBiH4s=;
        b=BaMi8Mta04kSGEkHJST/5aKwePOs+eW0YdlJvyrXliXMwc9vKN+Ku2DsNLSYlPi+cR
         0M5Iv9jqwsEot6N22uhjMMDGaLkpUAPUHpxnLHz3DSChL2xMWEMFPOBfuWpMB7UDEbdd
         D0R7o7pdnZxWAAw2nbNMIn/Rc+VX3kYo3yOemVI8oNue4FcqIDOBYmY5KKuU6EFRb53y
         DevPWMUDcZLvM7V2deKAyoP73KBgaxZhEJeDVHpaKjDNuR8/5P4YvV6KSDYzW9VKiqDu
         9voDd5J57+0VYbP6tErKKnGXj32GwesKAC4jVRmM50FKHhnpkZ8D44NMsQZW+7RihoWD
         7HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863354; x=1775468154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dw3GlJzRigow5MEAZRBZ9gfDU7AZvtgosUcNlmBiH4s=;
        b=c/cEX/x91YeX+hASHLLlLJN5XZ/LXOYFHwWNeuzqBiZxPG93uhk8n7Q9AVs34rDh3f
         5fd0h9l7I2gsBNxKWsNQS/w1vZAQ3ZKjdvZG2hPMWzuc/ihRTUFY/7+1sDC4L6dSDK7P
         eOpSs32CZrMXUQCq7k2d+xqK3Tq24+xrenqgU43YWbQPVUglX1CXQpxNzYOyRmHDXSXO
         Rpk2IUErze84DHxoOZ5Q5z/EXgH1gXvOf8DEJsPFPmxX0DlnUpKRyVbgT3Kp9HkQIf2O
         3Chs84XlLzbqBqTAkILAG9Phw3vfNSH5aDoZEiL9aMRgslyaxnYDdB7bpnIDPqcloIkk
         83Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW3WcIzGfXZjCJ0zce1v32/Lgsx2VbkIqr0H7CS2ZU0oKaMxYky7clY4moJFRpopsablXmRazhOvXCRfwfC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/5bF13kLO325qHRCO9Sh+q9klNfkmvr2IC9eC+9kkQI8l7N6Z
	yYMg/PYm/pkZA/gdhXl3McfgHdbnAD10A5TZN1enEGKkMyzbl24n1kzA
X-Gm-Gg: ATEYQzwvnDZfjr/DDnm0zmGFxFo5ieZ4mM4CJ5EWuWJ/Uu8fWYbodlD/Fj8k8XGE8U9
	ErrAS5HZpdNULEUfvKaY4wDgnoV8m8e6FRsYOjbL2GhxJOxk+eySZGN8e28Vyygui286iheYm6y
	W7vZGilz5xSo5MyCcb//foi763Vcw2YrP//mXqOBNFiLHyYA7WPiv7vQMWLiNCWspN46ZrCoaNz
	2LuN/7lP+Y0+ja2zUvJHtZlLDAw4fh4HflcP+LsI61W3xdugEZFHBcs6s583yTnroKxHKaOd4Yd
	XWSqy/0ONK5UOODHTCbtzonlSWmjWpGJtfaUK8pgxUOiViThFSDx7vRuGSfM5tGFskwdJN1EwaR
	aS1ZgdvSwqLCMnSlyd3kTL604OILKhISZvGlHjj+ND9kHWGQGB8YMf857/0Ujf1WoFvMK+z9z7X
	AJ1wDwJKXkr+N3EXm8PeI=
X-Received: by 2002:a05:600c:c87:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-48727ede17amr203752735e9.23.1774863354250;
        Mon, 30 Mar 2026 02:35:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26884641f8f.0.2026.03.30.02.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:53 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] staging: vc04_services: vchiq-mmal: validate
 component index in event_to_host_cb()
Message-ID: <acovDyj3L4ORCn-H@stanley.mountain>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
 <20260329071616.507876-2-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260329071616.507876-2-sebasjosue84@gmail.com>

On Sun, Mar 29, 2026 at 01:15:39AM -0600, Sebastian Josue Alba Vives wrote:
> From: Sebastián Alba Vives <sebasjosue84@gmail.com>
> 
> event_to_host_cb() uses msg->u.event_to_host.client_component as an
> index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
> = 64) without bounds validation. While the kernel generally trusts the
> hardware it is bound to, a bounds check here hardens the driver against
> potential firmware bugs that could otherwise cause an uncontrolled
> out-of-bounds array access and kernel crash.
> 
> Add a bounds check on comp_idx before using it as an array index and
> move the component pointer assignment after the validation. Use
> pr_err_ratelimited() to avoid log flooding. Note: this file does not
> currently have access to a struct device, so dev_err() is not available.
> 
> Cc: stable@vger.kernel.org
> Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")

This fixes tag is wrong.  That patch just moves code around.

I can't apply this patch to linux-next.  Is this another out of tree
bug?

regards,
dan carpenter

