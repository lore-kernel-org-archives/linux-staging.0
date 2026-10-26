Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993730;
	b=ESNhevbVlKD1nk77ajZ3I5/w1+mwsqangwu4vzwiOwHZP3VAbCxR93BUIIw2UCe0nPz2
	 QFMmN8qto+kSyoPyymi2hCM2LSlYl+9zPX6QlaL+mxa/t05UUfnUslxrqBsi1YYa0PR7E
	 oVQducneFJV05RnX9hg31/szSuXSjskQTyIk77LU9Yb0M4IOw4jI8Mk9eYmJSn1yotNoE
	 ljpEOhPRKWHZ6Y+0H2TIGL8c3iE6MOvIe5I6Hv4kx1rjU2iCyFFLz6jr7W7QkmAReikcT
	 J9NFfuhP8xfJ7q+JLa99cAjLGIMkMP5ticsPj/cHYmHumkHgHrU3JvBUojt4L85YxRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RYAYmmDh2YKbl8OgItUgUWB8sbjY7eRAlNwNblYFtjE=;
	b=sXtFzE85DBwNXh2HeYYfPnyixPBXQQYCk9bsz4pskmfa49IwTlRWua/zydyrr9q5QziD
	 bCUwPoowTm201SDtj4bVaqVTSlTLPcQc5qY98XJMxQd7VSr5THgQhsKTJZs/zG5G/4bxx
	 MFxb64f00Fp8tHXQ6EmttDND7dTU8gShs0ZXBw9O/3kCrymkLBLALqivd9YkK5cv3J4ND
	 VgpB2JYSiNY4JwCbw6ecKL5G1dFKV5gLBQqoc0lHje4Crp5qdj7hwPtwhqYDAQK44I8cp
	 5nJZMWI/lS7gXmhJg51m6hwrXkJLjcBHj6N5O3HgfBcW3RpF+vaRnYrYH0/f4H8bDQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PK3vGnPS;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC5D606A31F
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 05:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC5D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PK3vGnPS
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso2418419f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 22:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993728; x=1793598528; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RYAYmmDh2YKbl8OgItUgUWB8sbjY7eRAlNwNblYFtjE=;
        b=PK3vGnPSHzKJt35v7GNOcXyJZLOP4qMx20UFtibqePCIlXNiPl116EM2iW3p2yEQzu
         5ev8NUldapka+HGygMPNN92mf94Jizoq15j60oGaViCKrIHSIf4HHyIKSgxkon3y5GhU
         wcQc0AwIbDgXqP/0UXGeE6aBsYvNKVxt2X/NgBlfFC4/o+Igvyqy68MQihnYte/jck2r
         /O5MVN4/xoLpiJzGN4e/Q5NT6U+lRpsC0XtTiMLx6IVK8ZbvsuwHxi20s1zLSlTebyXS
         gyQZ/BfA1wWLITguKh+qxxSWq8QMXo2XsS8F7WxFuRMbW6bb3ftd48tM1MJ2/gSj2MyF
         3mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993728; x=1793598528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYAYmmDh2YKbl8OgItUgUWB8sbjY7eRAlNwNblYFtjE=;
        b=RoWX2fjGv+dV0OFUylNQ0HQ5ugUax1khw7VxOJcju/WY9nwFfeVurzYIE9HZlLQnU0
         /6uVoItF0weB+12/oMUHSzEsiyk5VhHeE1GSuw+zlN3HUIsSWMZcr07u97mg9OnNiKCL
         OmWZ+EG/QXr73WierAvzMcmpW0D6kI/TQ7IrXxbBi9XSFXSXaChj5CUedlwY051hUx0W
         rsX0hvay+T8Y8Z3gPWQPdC9hIicRfNAqEysyU1OVb35IUYMKwJ4X6cabjj5vl25J3DbE
         p58VH+ifsGp65L8A8eD0RVb+3KpgDx+4VT+1u+o8RizkpyFpa+cDBC3Agg5XH0UlBCNm
         VJ0A==
X-Forwarded-Encrypted: i=1; AKwUvBwwunP9+oHpylrJxsV8/38mJ9Aqg+ZI3ubV7r53+u7tNo2lJWIJV65GT06DllDxXCC2aNyJ1DIie2qbR+IJ@lists.linux.dev
X-Gm-Message-State: AFq9FYJNXF3UXCdzfa8UdEoF64JbjVNljW+0gn3dox5x8Ur4AqJMJYNZ
	Q2ZCRw7ewtmcVhHQTuNa8Q8SXi7cqEcJRdH5XaWxPLkN2QTDiNLKp2Sn
X-Gm-Gg: AYBFou2pn/N8P7Dvi1Igd2vuqhn1X2KkBU+0Wz54iz2ZKRfWdj/i45J4Bvy0nq5z9Jz
	s9xcweqI1lFqFjx3gQz8DoTMrscEr+jG1PFDEmFfHSrtrpOgnmUnnWOx7n4yJkh14k8GdcRYUkq
	NogUFvFcgb0GDUl/IMqME6s3pZIeuBTZejnsBdRCg3w267QgAoxjsBwBGBuOECx09fThlNfaiEf
	qvQLdyes5owFy1ZvSFN/9wxTx4UfmrdYsCdYfheIaDRoIoO98RPIhaZ1eNH2vNUErTkg1PpHSyt
	S1Rn0zMY7wbqyVhftDYqaDlYgDmWzFllaHDCr5Da8BRBPYYAdK6v683J+NCymgx4etrFBKSgAB0
	nUPNOZgepfQHTwE+/sj2YYz/9aLDLZqoh92XbigsNmwckPQZIvG/fve+xgXH3vZIi/K3fB2oqPK
	sd6F3Qq1hUC6ujmdgHAWuMNrtz5R3Ij7VaVUXriaPQy4wPzC87jpfUTg3hPTdLtzxYskxziWnG5
	OJ0vIrP7/WhDJUPRCGsnbuLugCwU44n+q/ANhTID4q5Q6KX0W3Ngj92eZyO+hhdcd7+izdDYw==
X-Received: by 2002:a5d:6184:0:b0:48e:22fd:1ea3 with SMTP id ffacd0b85a97d-48e3eb93665mr8333616f8f.28.1792993728187;
        Sun, 25 Oct 2026 22:48:48 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm14713554f8f.27.2026.10.25.22.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:48:47 -0700 (PDT)
Date: Mon, 26 Oct 2026 08:48:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
Message-ID: <at7pu4hldDTgZtXy@stanley.mountain>
References: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>
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
In-Reply-To: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>

On Sun, Oct 25, 2026 at 10:10:03PM +0530, himanshu bakshi wrote:
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> 
> Hi Andy,
> 

We don't need this in a commit message.

Also I would prefer to delete these weirdo debug messages.  The
normal dev_dbg() messages are good enough.  Plus, is this even
used?

regards,
dan carpenter

