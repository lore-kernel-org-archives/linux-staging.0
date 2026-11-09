Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203502;
	b=ppByev7jiM9CkvGMq2x+gVcwM3CQM70s1G7QXH9aSKjX9bwgfjRWZ7r8VA1D81RzdDvQ
	 teYXv4af3cQyodp1KGuUW16vCDxlVAWnS3sad0ezWNHSMW1ns994q8xSSIDMlGaxokZBJ
	 YgnEUqeWaOLggjEsp+Xth7q0la3QMNL/Kpfl4IAAj3L+WsIYNIJt3i+ypgcH9rcqb2o0E
	 1rO0XN1C/r5+LTRPW/0gS9QCaGhUPNdYPHpjRPcqUwXWyohVLrDI/LXHBv2hpuoZmUE2Q
	 ZsoaGB0D0iroKV5cy4G8XdoCwo40Q7nbTuLcYE3br/CbIXl95ybCku6yM+w2GUnVW1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VwgfRQAB9Bn+sLq8sfKEfMs/lmXrqxvASZHK8XhqIgY=;
	b=PDW1mgYwsrAHbNXpi9rEv9s6E0tHvGvA9OXlnhpE/T+jJ3azYQTgoZS+MnNFFNj02KB/
	 Tj5Pv5ayCH4lIrVgomOFLIFrRgxnt71HOADQGImBWFLwpU5+Rt0ZrpicFVqDDLZUWQkJm
	 wvvfdmCHHre1bLn7Teh4gIAZ97dq5MrUAyvnkUCsl7sw0LlVVjksgUJhqN3MFThllOAn0
	 e7mBhfJraX8pPTyxQgEFGpUGFcEvWAzD6WyD+w02O/M9hJ1SZvgUSH6jyTI4d7kCifkVA
	 BFvo5tgSOhYqnenoxr/oDIJJlVNELHhS+v5IHe3sVfc/kd8J+leo2GXchBUD3sAjn6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I9nJj/R4";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963EA606A321
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 05:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 963EA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I9nJj/R4
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e46e449e8so280363f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Nov 2026 21:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203500; x=1794808300; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VwgfRQAB9Bn+sLq8sfKEfMs/lmXrqxvASZHK8XhqIgY=;
        b=I9nJj/R4zR5asqYuk7XgWiUtZB/2z8zjn1+jKy7UEJdsOyDOUV+Je6NQh9HRV9QtKd
         53KfqoG5UC4GzYQONdZmF+HV6kyfmPZhKaqTbpBEHeZMlgoFo4K9k8zVeupH+6rpKrtV
         ctpElTcaaQjQnDLxn90OOGRQkTFJIWSZVAGJDBW6O1fZ5WwyWaTk4MYKP+/yPcKIG0ug
         PShFubntD722j16vZj/FZ/5gTVx3EydcjPKf8HUDUTGSwGS7uZVxzrxGPPZ21YJ6rXea
         RjhU+tSdvuijmEu3DFkp0FZvG/dx7hI0JGTr3hjw/+fp2SSodvBblpNe0yamMs9VYB58
         JwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203500; x=1794808300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwgfRQAB9Bn+sLq8sfKEfMs/lmXrqxvASZHK8XhqIgY=;
        b=zhO7KH2K8ua5RK7dXZcm5UTsRsTo+f574dPBiWT15kJzyOWLgiAZxuhQQuVJl/DGpH
         mmM9+/YMflcV6VLCbsDEcGMK6bZJ+aV5VmMEPxP3c1ilCQciGIYse1b5JJEYwkBlpVPX
         JtaORmfLXotYPqcvd0kkXqkQ5WUNYxs2M0kn93TO0YwuEBxcqKXBNJU8dymZNk9jkCzD
         aMyVDPHKadH2eKmKFQXcXWWKCm094z5GLmp8363+awuyHbABtwmMpOdkfKnkCpWmYHYq
         x2WlDY2VMxD1TelXjKLzt2qRzL7nSWSPbmQysyRDsY9V5sshkWFY1ZmdeQWLDFshM2oS
         SWKg==
X-Forwarded-Encrypted: i=1; AL+hErHnYeyYgXhJ0eQjLN9CwMnsifozQRc338PIPnZAjgNSMSQ0ZaShUq5PSUPW4ZPPCOBnNts05n/DEHMrlFoZ@lists.linux.dev
X-Gm-Message-State: APuU4Z8rDOvgXnnqEF5jJMZSOTCUrTVQRvgh5okuoQvzCKxDVHrG5Nz/
	5nmvY0X3FNxjT9SuG4Dp5J8NQXEDxEGFO58tXFuQD7fW90vdNLg2X+cK
X-Gm-Gg: AYBFou0yjxVsmNZFrSuh/xmqGwg5d1B9d1Nl2FLuzBykDOWczYq5aP0yFYdNlwQjSrj
	ZbfK6cYDYvVS6CwKIBKN40O4uy5M+lXA93n/1OKYjZmExBMgGePxXLFuh4M2+fub2ETHHu9Qrkc
	6CsIZ5HiTw33Wm7GOcSkKCUCDLB2g0fWel7/hpJLylkFgtnUNP6xkjCfiqhz7/n8OJVtiCCDZmk
	X5bBrPi8d+hBKEeIYhGgujjnNr51jXS0rm9hXYlrMvItLyNfrYQj4cIHf2AzFiLsZf3/p7opWy0
	jjvJ0cvkTz4pSbX3/CGzI2qaq3EV7K03xSQIJCuCW9re9KWiTOSi0Nv2SJZV1KWTlnFoiUxSicd
	H0EIPZXm38jEXERUbmkSvpy9LezVvIyYPt+64y7rU/D6WrJ+0h1/eiylT4R955/+TPmaXv/j+OI
	MwrH/J5AbDnk8+cin4sGN0CLcKIQktkUR5buAO0HPLEtBOTwdQR2QDsPbTxPEXzFzuY8DKZ7Eo+
	XWbBR4JrUDob5ASQWnt3/EFWbJwCkArHlMqcxnmdnSih4teIAybHhWcqJ5/J8DRRA050tjfLNqF
	7Gv9k+QxBm7BHgtmKHtC1yphfHYT9sxMwBOW19Bq/k48M+z37KHG7S5IJdD3HBBkbEY+GDl2p+n
	tfPMmSh5C8A3tdiePcYtlQk8Vz8L4mXrSC4FwKftt5gcUh8TsRdVppTBNoVGh9tc28Q==
X-Received: by 2002:a05:6000:4614:b0:490:6e0f:a024 with SMTP id ffacd0b85a97d-4958ac94f8bmr5349051f8f.13.1794203499894;
        Sun, 08 Nov 2026 21:51:39 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm7968081f8f.47.2026.11.08.21.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:51:38 -0800 (PST)
Date: Mon, 9 Nov 2026 08:51:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newline in sysfs_emit
Message-ID: <avFfZ0-IYSlUhk4Q@stanley.mountain>
References: <20261109034126.402391-1-singhpriyanshu9838@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109034126.402391-1-singhpriyanshu9838@gmail.com>

On Mon, Nov 09, 2026 at 03:41:26AM +0000, Priyanshu Singh wrote:
> Add  newline '\n' to sysfs_emit() format strings to
> resolve checkpatch.pl warnings.
> 
> Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
> ---

Nope.  Search the archives (lore.kernel.org) to see why this is
not correct.

regards,
dan carpenter

