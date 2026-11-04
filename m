Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778326;
	b=HH9sn+Nt6ifWjguJN4dQOA6tMYrzqMFiZjrwt0aDeA9f9zeZz4vp2Itnt+E3N85WbNDf
	 KXuSx8eesEF5P58LJgnKg4fw8WQAtZ+P28N1A3QMVc9ntRgq+p+9YqtzvsRlYaTngD6CI
	 jWpkG+xh+7FXILpiTQFvghaMcuUc88pWBUNvRzIwmWrPSF3aIyDzk9vPOdIVz6k7EmdSi
	 FnVAiDRMrzFz7MWAUI6tlXOHSo61BkOFYrZJyHRcgA1vUbdNxjbklBECgQwjzYmM607pt
	 7FUpkF/8h0wC36dzfq6j9ilX86n/MKZOVD8XPflC7C2juYm5in0O60tIV+kT0AnfwgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pnt3KSzY3nB/PhI3YgYt3oLll9I94JX0tyNaP0awMfQ=;
	b=AfutqAXVfUfUbvhf3EJN/cXb1quwtfwTMTQGDLBH90SqL+mqMwCNaUxEnEDU25zH6Wdr
	 Mh6aHhFZPOqCnCEKo4Q/9C+jbVQ44rAv8tLEKSmF2GqdcpimiU1p32XMbPdHwF8cLaCxB
	 D8zj79zwK4bUaPVwPnAU79PiZQnzQUO3RBq9ATMFQ6XJaj70b7ll16wVzBUL+w9lHJV6X
	 8yo2Yq2tZxVIsnjgQ6ob7W8YxPf8L/RqJxd7ilRJ+UiG07x/TtF2AZUYThWxn7sHQo6PQ
	 o5tSBpT5Q8DE7KfIZzHnfuRsLxXEe3/HgVWM8DeM7SSbU2NsN0ikA/bVJXBuzOU/UDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oO/gjWNX";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D7606A329
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 07:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688D7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oO/gjWNX
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso281629f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 23:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778325; x=1794383125; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pnt3KSzY3nB/PhI3YgYt3oLll9I94JX0tyNaP0awMfQ=;
        b=oO/gjWNXp3D3wba4vOPCMklosdMGaO0ovqw6Nbkb+WwQ7FJjr5dJ/CgpvEZBC6IalW
         hf8c3zL2RTNwfvgqlM8TewKC5VSsKI/gXLxeYvLv8axw/zPMrInx9MAovXi5T/cp9cIi
         Ja7SCBBEqrCmO3kGXN00A3jkTQYeg6gIs1Tzk9T3uMrgN9AdM0pN/UR6h3K/IB9IFkV1
         NCu40VXMwCC2dtmiufrpKySAF00EzUbCzPoa3aAX6iqu3h/zQUguh8TwdukhY8e6o1V0
         eoV8wGp/nKxTq2jKR57w6CqXvvCoTAyhSl9J6TKyszxiw059P/p0vKcPQqIpIE/TrM7W
         odLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778325; x=1794383125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnt3KSzY3nB/PhI3YgYt3oLll9I94JX0tyNaP0awMfQ=;
        b=P94DBg2gr9whS4imSYoCyoZxZAw5QxxH3rYlLs4gepsNTs70vPaE/inafee+Tud5sK
         AYGACVorpdkc6gLLnpUNbHxjDFxHIg9v0n/mCF/Fb632jX2uifsDEsrTNAR92PiWRbGl
         mQg4xQ+p0H8Lwq8Qx3JUi3w3nuW0+MpQN6/6xTwTIgowXoT364b4ITE+tee8nXOPJ/XW
         FjlklHxaZjScrcgVu2+wzDRq/CKSIdqN+YIpfgx46FuYosH7+y/hKHVviXEOYrQszPrs
         XYguBgEoDeziKFw4ESLyzZPrunuzs1GkrnkPBh1e4Fd32Ee8UfCsiAks1gvtI0OGAsmM
         K2pw==
X-Forwarded-Encrypted: i=1; AKwUvBxsGWjC4VvgFdSr4btQYYO453fswLtJ+0PbqPrwyrXgLCZuPSV8hl3xH8Ox9aJg7CiBzDqKiWpVa4ZoTQU4@lists.linux.dev
X-Gm-Message-State: APuU4Z/xwqeMEcshSrLl+5N+MFxl82WKcio6fNbCAN4TfzE8BGVVb7XH
	n8PtSzrN6hCu9yvYcTqrglu0yS8JZVwZ9Vm1Ut6eHNRa4f8PoCYhtWnw
X-Gm-Gg: AYBFou3x0T/+3OM0kFS03C71L6sAtK6RG7iL/Zy1BJ5CaFAJeBuJxN/PwoHcgRHe9Om
	QTRuSXw7MMmgLZ/MeBzbhnRd94TASG5x5WJiEj4WLAfKizQ6fBaLkQLNVzKiSomW3XF9igbrS4y
	8NO9b+DhBC3TSAGBVU+8nhvUQ9DB7i/bYTi/aOBBqZn96sp4O12ZD8chGSvaMEEh2w1p+7BdK92
	zOCvVNRi1Uwypy8uzKiIaxdmimT0Rg5MaZlGc1Hnk7oUyBytPsVRUy9OjLAOKdtcjha3eEUTtjZ
	ptoShOCeb4+OQX9937ous4If6hFyO9+XeJSDS1dLx62Y5qFJUROO00c+s92BwJ/ZecQFM6PALv6
	l4VFFBEERt6SqCZAe0pLa7Ren6KRsc/tbov9e+UJAmy75ioj/Nkamlvqztx2VxfJ3OiJTzCM/Wu
	0Va6jRh1FmzekoU9GVu0MOhCxOPCVIdO1XyZ6wPuacgELgsWGp3KUhsogyyX0sKnX5ID3W/CSzG
	OpcOcxgk6uOkKsW4B+ZnxDtIzVgIfbvmdifjLytB+8LyBXTdqh9+Mtqg2nyHqJ5DFsLc8yT609z
	qw2Gb83aKlagHiF+6GJr8qEjpwf6h4p2M037pFk0oWtRpFmDDtsYWjn04zWEwqNSqMVvOY2OE9h
	CzZjam5hCtzo4Jsz6QR/QFVQ2VkU4LTyVj1NyQmI3vd9gE/XkYgXouz5hEc7QuroVcw==
X-Received: by 2002:a05:6000:2c09:b0:48d:ff06:c626 with SMTP id ffacd0b85a97d-48e6e50089emr33780443f8f.35.1793778324515;
        Tue, 03 Nov 2026 23:45:24 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d88e1sm2415089f8f.15.2026.11.03.23.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:45:23 -0800 (PST)
Date: Wed, 4 Nov 2026 10:45:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: release the port device node in
 cvm_oct_probe
Message-ID: <aurikMTyOVMRHDl9@stanley.mountain>
References: <20261104021450.1468423-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104021450.1468423-1-vulab@iscas.ac.cn>

On Wed, Nov 04, 2026 at 02:14:50AM +0000, Wentao Liang wrote:
> cvm_oct_probe() looks up the device node of every port with
> cvm_oct_node_for_port(), which walks the children with
> for_each_child_of_node() and therefore returns the node with an
> incremented reference count.  The reference is stored in
> priv->of_node and used for the lifetime of the net_device, but it is
> never dropped: both probe error paths free the net_device without
> releasing the node, and cvm_oct_remove_device() does the same on
> unbind.  Each failed or torn down port therefore keeps its device node
> referenced forever.
> 
> Add the missing of_node_put() in the two probe error paths and in
> cvm_oct_remove_device(), which also covers the error cleanup done after
> the ports have been registered.  of_node_put() accepts the NULL node of
> the POW device.
> 
> Fixes: 422d97b8b05e ("Revert "staging: octeon: delete driver"")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Normally with firmware, we just take a reference to the firmware node,
read the information we need to probe, and then release the reference.

Is there any need to hold the reference here until basically the system
shuts down?

regards,
dan carpenter

