Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE12472A2
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854786; cv=none; b=XAgIhaSuM4mtuSuBHCaKORt51nl7w6BR74jQmDGqbpCJe86kwiZy6G/SPAxzmp4uswh+loE96cr7XZaSzgFSE/sHUVw/WpfllZHtf+qZg8aqMTWGTxI0A3U3LxJW25dv/5X9hU1AHnxxA6f0D3dyUU8SC1SCPC0JxTw++XEd2uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854786; c=relaxed/simple;
	bh=fixTMnw1wCe4SQW1Mpx/hz/yAjnGwm9mXVrqZi+gr5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2rW0hpacg+Vdxrz/qX0Q9V7twHznU5W4QIGqmQeFERG1KtCiD4gi3eeGt+99W3jTWqI1tx/1GsDlh+PcY18klyxLAalB8vADxJpqhFaSR1UFA6kjS+d69kEza2/ejCu5WDcttj79ULDGVUPj74rVMU1fgAJMwYpxqEc6+fOKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myvewiED; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myvewiED"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so200995e9.3
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854781; x=1788459581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fixTMnw1wCe4SQW1Mpx/hz/yAjnGwm9mXVrqZi+gr5Q=;
        b=myvewiEDDs/jLLDdrmvr68ogrPjHDXs3ecdqZt3+jPaH2J2v+FKpDpPkkbLBgixod0
         FFDh3/Pm+W0nF5hTot6EFHa/EB7/Z1w7aw0lEkYiJSKzHlImIF5WBa9nl5aQOZxCa43s
         GaTdxQDYDXl3y/5EFu9k3aGYJjHGwGixiaw/KAsVG2Kr1l8je2lJR1WzGueEeoEUN0tN
         l/DGlrkOZceZbCYUrciANgK+mz2Lpc7Z+qHbd8ouDDOTWskmOxwPY5TKyt0oGkuaNk6S
         dV2WJs912pEj2+hKp66UgY46YO6O97bom/HKbMiX4CiZvqRCTu5f5CiGM+lt7lWyVmDL
         E4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854781; x=1788459581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fixTMnw1wCe4SQW1Mpx/hz/yAjnGwm9mXVrqZi+gr5Q=;
        b=IcveqXc8vui+zrIKB72VyfCQNjUOUZqP2PSn1kIwt6eWEM7APzn43ptwA3hR8RkBn9
         PIeMhBDbl7PXrl5U8MFvMguU7l4b/9+woaGDtTSZN15lKVb1fHtil9oy5uOnfc70OuUF
         CULvWkXFYMHf70KGqMemgNN3+j1EXPApHOorRGccAhfJ4WEOFXVAjN0l0NFNHAoTJd5U
         H81kqP/jBfEhtYZc89/4gPFpknZzX51T+U0JdvBmuD/+byOxk5IcbeYV99ZzYc8w0w5B
         IZG+bn2IfRefInWUkWNDizi/kvVTfShkrJ6O2KL5LnBf4l6eFUHTM2rYk+XzmCr6NXew
         mg2A==
X-Forwarded-Encrypted: i=1; AHgh+Rrpb3OGHKohXqcBoOjLR0btdF+g37HDJ7wOr+rLe/ScfjfCl+YexUfWXxfWjkyxcTQOK/H+Y82ZsGk8xA4K@lists.linux.dev
X-Gm-Message-State: AFuF++mcHZxodGCjOAJdz6uqM5uxPz+7n5HF3oZ7qm0jyLVi2uBD4Wls
	dmAyUE4jGFlNftj79an9h2SCo1ZeJrfcsY8alcQXaG5QizdxDJVIAxlU
X-Gm-Gg: AR+sD11O77bt6u+I0+oAiz+2lcZjvQhFG70PCb4MzhB6sl7ojQZLoL9jccrG6j+w4Kh
	meLKwX9BfpQEOUgNZPNKuODO/F/s8ueyYGaJcNZVpkvj4DcYT2zeyk2FsH+mcxNKnc6qnEjCcpo
	oivGxsHTXS2EpQnNmfQuX7aeiiUmjn/AkqwwoQ/sN6clrZjvpNO/ZfQYTckQUFwmaxrYNS0i2xU
	53r9/ufPQYpmLp8/vLFUqpqIWkTKdoX176e9lef9J4iMGZAJMrCKNXfUG6bN1OM5uyxnPHXndk/
	gB/yXBqxNZ/DbL/Jwbbd9ITPBAGhnZ6N4HTkXVguy7oNRjL7CRySSNKO94QvdUAboGti0IDUqhr
	N5FE/aeCqGb5dkeW6BcWg+QFHTXfWKdZ+x/7yzallbAYkAZWqKseME/G+ehqP+EmgqN/GgAXWIV
	fuP6EpmEy852v8ZPMKf+wwGRi1TRr7/e/ffle631X/emKnhetdAPJGLUyNdT2PoKE8kJ3y+hjuY
	K99iq+oKdntZlEtoy4NgDfbOhevfnI5AoB3Uj64Cbpxeg==
X-Received: by 2002:a05:600c:530f:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-49b91bd1552mr13828835e9.0.1787854780571;
        Thu, 27 Aug 2026 11:19:40 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91ca314fsm4381035e9.3.2026.08.27.11.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:39 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 1/8] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Thu, 27 Aug 2026 20:19:31 +0200
Message-ID: <20260827181931.2432507-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAGGD27ZUFHQ6Aa@ashevche-desk.local>
References: <apAGGD27ZUFHQ6Aa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you. v2 splits the existing 24 MHz digital-gain packing into a
preparatory patch before adding the clock-specific path.

I retained the two masks and shift for that existing path because the 14-bit
control value is not laid out contiguously in the 16-bit register write:
0x350a receives gain[13:6], while 0x350b[5:0] receives gain[5:0]. A single
combined mask would not perform that repacking.

The remaining review points are addressed in v2, including HZ_PER_MHZ,
single-line writes, a table-selected gain range, and declaration/layout
cleanup. Pahole on the final built object reports struct ov8858 at 792 bytes,
with xvclk_rate naturally aligned at offset 8 and no hole introduced by it.

Maurizio
