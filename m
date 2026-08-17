Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7AC3AE704
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003512; cv=none; b=OOKNksnZSx+tzZP+OPEcyF1vwEp6jDGxLxD9XfD3BzculWiKJKboE5ICfW4V109zX90doP/a8UTpnTWaPfwvvpyP3VsnkEE4Yqi/NqG4nt/w5fyTukbZGZqGT03vT3ockuNjul9I5/wxegu7m08Ex9ACxSUhJjcs6os1ttRRods=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003512; c=relaxed/simple;
	bh=lU9U9QN38XnK6YnkDIm68oTkp1mphR/YDOaEW77OJAg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=TafP3NuC6m7HyOYefXxedkp5ZluKmZCWbLHvCWY9Sjm559vsFyR7V9xK02rXa2iTzWZ+E7SvB2Af6BnxSbeKbePeD4fwdN3GWmkro5glG9npd3S+S0bAS+S3gvYhQ/GNwKtMPaP7M0WW675cVjhkFoMcvjjxBHfFoqyEpf70Q8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb3ig1Ui; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb3ig1Ui"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso26463135e9.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 14:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003507; x=1787608307; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lU9U9QN38XnK6YnkDIm68oTkp1mphR/YDOaEW77OJAg=;
        b=Yb3ig1Uio+fhqGrHObC5X+v/UdC0mzzyaXWYuoPhW1B+FOxVGZ9Z2ll5ypR9hDmKHR
         yvkaU85ay907o9IaEdhGEJcJBp/o+x3QltRKO5va2PgEm/u1uYmP8Fpx8z9o3ZV2zSVt
         Eiwx7f/Zh6xJSnp3NGRbziePfmaIzxha3y/x5HfPcr3sAa53puzdBSDONQcG6QR9jQij
         CJfR1+X9tsUlmB7o8Vh8NKAJsV9kDhFiZ2jxzk62wDbkEZS3maD0WplG1lFUKi1dw/Dg
         kf3GP69Zi6P6nUtmN+LvqfUhL3N7DP81OnJY/k+xG3gNukh+5+znh/M/jbIsl+bjmxS5
         1lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003507; x=1787608307;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lU9U9QN38XnK6YnkDIm68oTkp1mphR/YDOaEW77OJAg=;
        b=izn2EyYfRTRH+mtf0hdXeBeHSiATk9Z6o8HLFEn5pSofs+/SkdbvvnXnwnJxn9wONf
         AIl9LF1hm85AaU2PZZ0zp4lhdF+MN5OBi0tpxDoZI48rGYBkScscuGr8ywBxB571LpVk
         Sg270gl1G6zDYcN1eykns9vXNHBoVZS1Vf83P6VJ9i9OaGcOtf2dY63wQG7+O46IpowQ
         9FSLXZC/Cs5kWIiFRay2Wgj9wi5rJdy88eZ0cNzWiw8REVDvA7UvhwkJmMY4roAiDYao
         JX6nO6knr1IMCfv7uzzDzg0Ym+Zp1U3Yu6r1LrwuI843Dg6Kt0cP995AmnYSmSU1jcRt
         ykBQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro06KxJNs89ecQh1n3/ZIm87zOHSuOajTr4QtzqNxEB9ybK85VIJCHvSJ3skw/fIWApt59TXBA7ekUQwqLo@lists.linux.dev
X-Gm-Message-State: AOJu0YzPkt80E08uD130MicaOVl3KR708nz9Ux5RqPDsVjWPzMD8yhoh
	Gfs+OBJTzS+h98rg+wTm5cAqtGR6KVESUZum4eDQw7sv0eOsK+VufRJR
X-Gm-Gg: AR+sD10W8yxNwyQ0kxmwiS3UsWAl2FcoJoeAt8PCkgm9WGVY2a3depCO/imfWTfg/qj
	xJrWgLOoH631GQswAkkkhnPD7cbNvlQx3N7UY4YD3MqatEnXlMzGwR6n5W0/spBYVlkHRvqf6Dr
	51S6TsypIPs1Jb+PTIEAUNq9BwXvpTtj7Y1f1zb9jxPJPvMfi/TcK4Kj6GGJn+6BIXx5VfNPqHJ
	/w+hOn6ze+/ZGrdqV2f+wMSBxf+/iDQ+dXzc48wtdX0Jc48QYlgbrLCoiFBTrPDeLKFZ+pr86DU
	c3Lt6N5uMJZlczlNvzTLchcE3EYoi3VGa4zersDBZplr9N+yX9nHTuvY4RfjDfMElJnwlVVjDFR
	0Pu/v6bZttPzJc6O/SXfcw0RQrRZXfwjLtWfK69ehmRwCw9aDaNj3MgXhlTCAj/JQf2Zk8m+WaW
	S6TiHnOEvpC/DeJb6p0P3dmgeWeoh+cjNe3Wy5utWnMAl+LyLLrPgkvQRQ/n/rVQuCLlY86p4im
	1LPTltdWaYJGHcdrXbWeTahzubQ1T327+K87DnJmuipymI9NzhMaxL8jXOENgi5PA==
X-Received: by 2002:a05:600c:3b1d:b0:499:79b9:e226 with SMTP id 5b1f17b1804b1-49988057986mr422726375e9.0.1787003507537;
        Mon, 17 Aug 2026 14:51:47 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998777caebsm301129065e9.0.2026.08.17.14.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:39:13 +0200
Message-Id: <DKRJLVL3NMYG.2J2QX2YKJJHKW@gmail.com>
Subject: Re: [PATCH v15 15/22] media: i2c: add Maxim GMSL2/3 deserializer
 framework
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-15-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-15-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

hweight_long(des->info->versions) >=3D 1 is true for any driver that
declares a version, so the check makes .set_link_version mandatory for
every chip driver. The "Multiple version" message suggests "> 1" was
intended. Both error messages also name .select_link_version(), which
does not exist.

An automated review already flagged the unguarded .select_links() call
in max_des_init_link_ser_xlate(). The same unguarded call is in
max_des_ser_attach_addr() (out_select_links) and max_des_i2c_atr_init().
Only max_des_i2c_mux_select() checks the op before calling it. The
">=3D 1" check is what currently requires every driver to provide the op,
so changing it to "> 1" alone would expose those call sites to a
single-version driver without .select_links.

In max_des_parse_src_dt_endpoint(): "Unsupported bus-type %u on port %u"
is printed with (pad, bus_type). The arguments seem swapped.

Doubled 10/12-bpp is handled at the PHY level via alt_mem_map10/12 in
max_des_get_phy_mode(), but the pipe-level dbl10/dbl12 (the
BPP10DBL/BPP12DBL bits the chip drivers write) are never set by the
core. Only dbl8 is. Is this on purpose, or should
max_des_get_pipe_mode() set dbl10/dbl12 as well? If it is intentional,
isn't the dbl10/dbl12 handling in the chip drivers unused?

The version loop in max_des_ser_attach_addr() sets RX_RATE using
set_link_version() and seems to rely on the select_links() call inside
max_des_init_link_ser_xlate() doing RESET_ONESHOT to latch it, as the
multi-link paths do. But max9296a_select_links() returns early for
num_links =3D=3D 1, before the reset. max96714_des_info declares both 3G an=
d
6G speeds, so on MAX96714 the fallback iteration writes a new rate with
no oneshot reset after it. The fallback rate would then not take effect,
and a 3G-only serializer may fail to attach, or attach with the wrong
version stored. How is the new rate meant to take effect in that case?

Also in the same loop, if no version bit is inside [min, max], the loop
ends with ret =3D=3D 0, and the code after it marks ser_xlate.en =3D true w=
ith
version =3D min - 1 and no serializer attached. Not reachable with the
current chip infos, but an info with an empty versions mask might hit it
(an empty mask also passes the probe check above, since
hweight_long(0) =3D=3D 0). Initializing ret to -ENOENT could solve it.

Kind Regards,
Artur Andrzejczak
