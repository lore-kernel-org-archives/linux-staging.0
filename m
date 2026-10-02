Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933C0438FF4
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 19:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970887; cv=pass; b=B5/YswtzxomtOgkSpmKJQUyWmAq191UvqJ9CmKusBY34thdJQZCpzBAv4m8LnvDinnT7Ppq8GsNebLdia+d72qyV+QkmCx/vkpfFvAkrZKyqr83VuFHuIRCIEKMzpzE2UotqKe5A1HHhBHc/DaWuCHlhZSFV0y7scYthXqJWQeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970887; c=relaxed/simple;
	bh=N0X02+qX1ELSle0mhMXX7fXns5jHMk1hbZWZ56LRbLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQLWowQVKM+COUW+qwNX1GBmDWbk10+O27qDbqcd7Xe26MzLuaANwNYulyJiu/RQl9mOnuG3Cv8xghkSZaUQJe2aaQ6vkY1yxe7fC2GKNBBTkLk3AQS37dhR2bRnncmmj/46YjAnbEKFtj7RjOiGmCyVonVKql/nMDlhq8Zk618=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtIaNGHL; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtIaNGHL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso1750605e9.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 12:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790970884; cv=none;
        d=google.com; s=arc-20260327;
        b=Ztw5l/W5jo4VR7IVmcmOi/cXcDW7+styw/yM1LuvTaIojQKjEyj6ZBCDHK5s3BoZOK
         BbknEcgy2MGdd2m8ZVyNwJyAEaPWzFj5Nffm7OoxrHBsaASWlERtS5PHbyzWpbEQb6wz
         N2JCrUeEZukawvVBOTyE0jNsbHRdIRDptQt9E4g8CHaVCn13imFB/t12Q4IokiP5sZtd
         5Bx9G6c3oh71yIBkNovHQDm+rNGAZCkjlRZW3HPEWGwxni+mI9ClBRJh+dx3M+8q6zcZ
         kXWCGOqsaLQvqmxk8qQolofnfz7D30MF6R/g47zSxadItAFSi+h7NL8ASN+BDeSyArBN
         He5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T56mB/qO7F2b19FjXTV0J3sIArXRsxwJOvZayG4wLs0=;
        fh=OG0zTpEeWfxWD6lc9a2tJ5SWjhvvYc8zP5ZjYNh7ARQ=;
        b=S+youUtJwTufNC5Yy1Y4lMl79D+EVvqbHnDU2Pvc5QHUDfCD7XnNsMDYi9JqzFAgLy
         f0ixAZxpLoz2Y+vuF8WYrsz4WxI3yLOK0F6/dZS/egW9NvVF9LfvCQVzOLqpwwtQsFPh
         gtoHe0R2v3+zSO1TiLTXhOR3X/SjgG4rjOWQk9t7y6yylfbCBro9ZpbpAbL0Ug16l6OU
         1hwCGJSC8ZGYqJVzZDjUpyEyMMOGVwb4iaq7eyYp96s6PzeOGPnIG0QIc/HriqsxhMEe
         BrLFJTKyRrM/XqT3/SnVYTnGSqgonhzqiLVH02xb1oKeq+NZAltZQncEBnmmgmuDLMWf
         I41Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970884; x=1791575684; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T56mB/qO7F2b19FjXTV0J3sIArXRsxwJOvZayG4wLs0=;
        b=dtIaNGHLEyGzUIasweSavWBTn6fc6FAuWm9vgCSqqM1n46xDhfGsulDfz6h/gFdED6
         JglZhblBz7FVEF76ATOqS3FJdsFswylM8XDh8U9IYdLAMWT0Puyovz744C6ZazZvjJii
         AO7R9+55BIpzGqkJMgIx0vwAWdvdlcrhyowTslGieRYigAYlsRlBlEen9hdDBoMl2wnT
         215OFhSIeQaZNhPhFKz7S9R5TrvhawBHh281ufiNL7llCci/cOOxCsCe7pEZ7BHYbChm
         z8LFPAF24VWdoobf6Wjw9kxXIram5EQQzE3BzOgPmL/gAm96jgi0keGQW3YlBOA9xOrV
         yh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970884; x=1791575684;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T56mB/qO7F2b19FjXTV0J3sIArXRsxwJOvZayG4wLs0=;
        b=yEd1UjoJyfbQQPl/Ej6z8bB9n8QxcrcEG7PsA6HpxwRrb2OFljSXrWg5F4TnesC8G2
         pc4ZgWUMnnrzKzO5U2qVPsFBwEQyx0aRtLD3TPirQqMJvkiR7VH2QjdVhc/EVsqcqbEF
         lV3fLtn4kAMl8iVgQVzX/z9qnvZXr3tK8DnlzWRMU+oP/tf0FVyMzq9CRg/n+0d5ZCOU
         5GOLbbkrNTNpy6cmfNXm3bUmd4ZVlvWJdeJajZdWuk/Dew9utcGgOW+bT103NkR5PvTM
         nOKRdo1RsOBm6rMKybeFPzEf6ErFCj3CAiF/Um4hXEq+R+0HDlIZKGco3pXFt33K7I5W
         msSw==
X-Forwarded-Encrypted: i=1; AKwUvByhrMGrsjEMcIaufaSN6jbXqSHVODsPJ8ach6E47kIjRoiWbQ/jGyYAeI5CrKnhL+vX/7+1R0ueQx26sfh1@lists.linux.dev
X-Gm-Message-State: AFuF++lIy7MfoT3mK3epnOV0Uj3uJzDa5q9Q9+k9zMXv9w+GCaYKxXra
	cWDlOBTcgdHo+5aCNMVFydqIzKA0BVzScQQ4XIHQE02Wjqa/8V3tO6pLq+SBbdrjyw6KDtswqQ5
	0m3RUdZdJ4flImfVs3oAlde2tp1kndRo=
X-Gm-Gg: AYBFou2RKqXjE2Otza52fHxU4w9MCXQi1OX3kelEWJN6BQYBfK0sxHAY2L4tSaJWyft
	VgMFwcIsBpW4gkRpKd8Yw10MMKITZmzCbhw+4qr60tPEPvfdNKaz7stkjFoMlPcupNIdo+O5Dah
	G/YONvgrvkN/9jEHN2uCFX+HPZgOJofNsnh22MyGRcLKjlVGzW8MWVDZAItx5fg2vTQ9FoLlpID
	hmyu1USe6iD6mbiH8O2J2GcfOiqTgJkA/Y2jbadI5wCV2rmKI1/wJnAlbSmKJn90Zks9w4hG7qg
	n87ST0RCUZUConr2UhVDpfYtCjn1cHgSm6S4eXKXSV+6P7BT5nVy7uV0tHbUaBzkc7T7M7ZSTYU
	fJUzvBreiznlFWO/GpNWLZ2QQ0EIJEV1/VdlnSoRVDNv5DlhqlaSrjMfIDmZ6uQXmkMIQrQVhOw
	k5kIHzeTAfxvPqNq7cUMUK3spmYKtqREv978UeOOk9FX7GWJNzbanJQwONrFUgpEA172rXMZcGx
	JdedKB1gAJPw/iEl3WTPlJKNk0=
X-Received: by 2002:a05:600c:34d1:b0:4a0:1cfd:321 with SMTP id
 5b1f17b1804b1-4a027579e86mr73608285e9.12.1790970883466; Fri, 02 Oct 2026
 12:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com> <20261002153302.5c64819d@jic23-hlaptop>
In-Reply-To: <20261002153302.5c64819d@jic23-hlaptop>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 2 Oct 2026 21:54:31 +0200
X-Gm-Features: AclHuK9A4vQb0c3SCwfTX0zGIN6ZaHH90-IWtc-T6bQxe6DLhdppT_Ep7cPDR3w
Message-ID: <CALoEA-z6Q3YyYZfLyRixk9dPy8mn+mmVJVUrjoCZb6T7FXcDSA@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: iio: accel: adis16203: fix axis mapping and cleanups
To: Jonathan Cameron <jic23@kernel.org>
Cc: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, gregkh@linuxfoundation.org, 
	nuno.sa@analog.com, Michael.Hennerich@analog.com, dlechner@baylibre.com, 
	andy@kernel.org, linux@analog.com, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	error27@gmail.com, narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Oct 2026 at 16:34, Jonathan Cameron <jic23@kernel.org> wrote:
> The driver no longer exists!  Support for the part was added to the
> adis16201 driver and the staging driver dropped.

This is also a case of "idiot reviewer forgot to check before reviewing" :/

--
Kind regards,
Joshua Crofts
