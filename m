Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079306;
	b=LTbwLiiNFmDXt5HjXtTA91V81orXKODhGJef4A/42gooS6AeimGGckv44yBDsf+fQran
	 b/gWHFZDUkdt1N/4rspGfPb6YvnPAvSd6eiZCCYTt1DgEK9SQIU2ruOUfKNsLLU2gTmeH
	 DLswQsCwtWrFqGTbx+Ut1LQEUK0KAd9XOGINuez6wvKS/Sqce6Trx3ZeinUKhhAsXKObM
	 TTf2JNjonVjly5jqYsMTonynHtoY7Yibmu2KirAJgRz+iVq/K+RuJfmEjtM9DEn4zZjra
	 4QWambXXugk8MImogvllW+vI9OB6CIRmuxZNsFty/YbuXeL1y3wJNnrXUh5DeAEH3qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hjwP3UPuVBpxDXWbtbEONQc9EqAwoM8fNiMF8hyJZOA=;
	b=UQuF19knxOKpLufgb/FjElljNHyh/caMRmkG1tZIIqBjaYNYBUhcARVt63vL4ztWRWAU
	 Df40E65b3ub7s5BC73aBjZtSyXbIf2N2gvgK4rxQZkVtXXPu6BqbezRAEWoHe/R5BMX+c
	 rgECwnMRxEguP1kISCbQ6hKP/BNzFBrJ7wMIeEpm3OzGLXDTKFisI2uK5x1GB8p3oo39E
	 E8Vw1+EGSuJQep6moksYlxnPggV9Obv6YTgrDt43ZYOixkeupqem6OGCdbHQd8ywnft+M
	 lRP8c0TA1hgeDHyeyT1aJIgwsdrONMCJuesRzl0kRvouy1EWxymZoN56Pgif4f6U/XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QZ1EtR5j;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0169606A31A
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 05:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0169606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QZ1EtR5j
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2023760f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 22:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793079304; x=1793684104; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hjwP3UPuVBpxDXWbtbEONQc9EqAwoM8fNiMF8hyJZOA=;
        b=QZ1EtR5jmp9wGDURexuGGaH9L17ftfo7V6tiRy2xe21Dn9zP4d3t5HLXJdeQOM3p65
         3M7LknfiBm2oc4JHeou1tb5ESd93jCo/FXlAOEDD2/0f5wR6vHM1UdLgSrJivJLCWspv
         qr9UUeFuC1NxZ64tsI6o3fepBmh7bYAsAQeMl/mkjSUAjcGL6GVjdNMKzEL/sJr24/3X
         bgu73MF2JbMLTr5NJuv+vOyCwk5sQK8mEnLO9FOGsDLKbeijcCrBc/DhOHqSEUUiuU5P
         tKdP/kt0n3KefE5GJu7cDbk9ctvQzFVl5SztJjBm8+FEzTTnKct3A1DzjWjF+96aODhM
         9zgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079304; x=1793684104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjwP3UPuVBpxDXWbtbEONQc9EqAwoM8fNiMF8hyJZOA=;
        b=BlNx+zLxR2UAaNnsT702OgoCOBClg6mNdVQWZh2CzFGENZszF8eSkWZEiP46tvNcEg
         m9/00dZedO5YiPJZSBI3RxyFPcv6mg5MD8fDPNaGKSNpBBjGvMAIYTxE/SGIMlNMtwAy
         l0qdcyLSb0go4324GX/59+6Yg+IsHl+/Uv5hN3e+DZTM+OvCJzbu+VDyKg/xOOsQAet5
         4M0Atk3mGRqyZxjKwenzXJP5L+labZ5SKSuD52lePk9nURT/GTFo2RMrMxn1ryWxJ5ex
         tgHs9KLUg9c/lv7KOKG+65pbGwXw69penSYoR7KqTRaJGdRjX/8mw8LDQUfktRKoOuRR
         NYqw==
X-Forwarded-Encrypted: i=1; AKwUvByXMaZ6aygBfGqGwEmt/ZdXHjHOVF3oZy6M0nDsBxTwvxYRiNO+AT+fTURQRj66Sv3I2oL+DxmGFTEUtWiv@lists.linux.dev
X-Gm-Message-State: AFq9FYIp2u/48r3Idz27FBOWgacZ4pAasidgtn2U1M8QZkIXHBSVZh9h
	Dh9xpxdZybBYGtkp0u92VYduSIriQFYwHdxdP3lrGGvziVCwLN8ro6mD
X-Gm-Gg: AYBFou3GRl2+/Mic1e6mTFOxCp+67Q770hmzpAbrK3IhY7QUIW9H14d0HCvEk0Uk4Yu
	HA+2/ssNx92MAOdEj2rz1VC3Mngb6oU1tSsfqmvAgymBDlKKVSsR6AqTQaskA0gxlziVuMJH6l3
	+rwK9rjJ8GwPFtrqAeVH3B5V5deH63oG2PsmYOwHI0OEf9XWZAaTAeufMz+Sl/gh4lLjcTPuKpZ
	+AyQVb0d5Vquwl33jwo1QX6utMJEw0cWGTbslsIlT2Gv3XDr/JzlmK+KHSWpI2WwCFrBV3YWWwF
	Xn0ny4v3biHT2yWDHd2dlZh7RDd1t+gMED+MCQ0xPNf+VeiU6qizdbjJTqxPQVyMKafgrkV+ZIg
	V+KF6/UlokiT8ynmj5KZFqLRZaHFjWxeeX+MSctnEboIwxd565UyyZoRHNHfDUNQb2xjX0DVwAg
	F2qFgM1mAOx947KVpMmfLbYTKOzv5CXYGLyVUb9yJrpVxjLra4b94sL7F/8Ouscb38o9xGGEIUz
	Q5xHPdPGFL3D0xbJ9+6qof6vD35UV021LMBqcm7qJJAvl0a1vj9sg==
X-Received: by 2002:a5d:504a:0:b0:48e:6f:a9c1 with SMTP id ffacd0b85a97d-48e3eba307fmr11592520f8f.54.1793079304172;
        Mon, 26 Oct 2026 22:35:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm21205393f8f.9.2026.10.26.22.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:35:03 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:34:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Albu Victor-Marian <albu.victor.m@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: Re: [PATCH 0/3] staging: rtl8723bs: checkpatch cleanup in ieee80211
 files
Message-ID: <auA4A9N5vYCH7Zwq@stanley.mountain>
References: <20261026205659.181065-1-albu.victor.m@gmail.com>
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
In-Reply-To: <20261026205659.181065-1-albu.victor.m@gmail.com>

This driver has been deleted in linux-next.

regards,
dan carpenter

