Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA373E49D0
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872721; cv=none; b=XwzQcmFCttpwbwDWw5HSPExgqJIZI3RN4aj0+MfESy4QRyoRyRcbOQe0zbowsa8hOGmOIMK6ohfUUKGeA4p15RCRo3L6ljIQSXFJQj33aIuKyyKR3tlGRAlbjmIb9KZwRJBnIyMhZ5Y4zCD2JbUEcZU+tWQPjjjELhiqM8F8m1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872721; c=relaxed/simple;
	bh=oN1zCuqthbfr0rkodWrBBXKKEj5WG9R6WXaOcfbuZ5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7XuIp0+vVaMUERjKEm254ukLX41QallyQiJAG6tXooTQpu36X7gTU/zVU7NGNjnca8lVmLNL85arMScCw4OevQzIv5wrVXL03xc0NbsuHD4mr1DolRnJepqgWWwiE5sPqGi6wdOi7Mhi5poh8QN9ig53JEv2rX1BQ4HexX5mMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmpAoIEe; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmpAoIEe"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso3454605e9.2
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872718; x=1788477518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oN1zCuqthbfr0rkodWrBBXKKEj5WG9R6WXaOcfbuZ5Q=;
        b=YmpAoIEeI0KTcBnK8qiS+BNexGDPgRr6pN+m4KI2W8Iu/dYxiSR2yT8Xk6RcnbH421
         Px/UsAwn+ZCeUn29NcL4fpBxk3yhAY5LG02TVmHOvuMtObu3qndMmPk7XpBZtvo+bp1k
         P96PiYbhIJ+kVVP47pyhEHUigClxJf4jAHm/fnIQUlTs5juIeoF7ilDRQ9aMsXEr8Hjf
         SupXaBtE41Ejmyu/ODWCT53ZoBLSvLrOkYNuObUWhaKr5FSXrYQ1PaXRv/l1+xRpr/MY
         xqnQfAfoBgOyejB8gBGSjHB/iBkPXBPDEgDBrJ/Llt+MAqj3L5cD3N5guW7L+iAGiKFx
         yjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872718; x=1788477518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oN1zCuqthbfr0rkodWrBBXKKEj5WG9R6WXaOcfbuZ5Q=;
        b=b7TV54X+ksinL8HWYR5hKqykCIPJ2u7a7IkEntJk96mje85YgqfapTao/5O7jQAYsF
         x4xYtfr6Ll7EqOv/R4PD7DEjmrSL6A3Tgsr/8QKehXmT4Wse1r+podOTIrWkiEsKVSaS
         kf+bHYEA2/seohTkleUgOLIPA3dqnCFYCQaQRNdzu8G2wZiJHKcMvEAolL/StWiohmOb
         TL+ywkqpSsaPcJ/maUHgnYh1FRNjL7c6xcqQuq0Y3vQ4uxBNLZJyIQ6ekAAIz0BsvV0l
         LvtgEyASJh2hLHxyzKLWTi8hEqMvU2dl8TIUUe+Un1zHHOPiknhhoEgwSBTJiJIcw9Xb
         o0Hw==
X-Forwarded-Encrypted: i=1; AHgh+RoFKY8F0qpphC0RUqAHvH2PkuNTaMXWPBXVqgA8pAE3VhO3sFtyadK7o9OMh+kMo3m+Y+O3FO77jCogDOio@lists.linux.dev
X-Gm-Message-State: AFuF++lANUWjJOThHlsLtRQccJOYaP2x1QtsIcb6OMO6VM8BvHTNgamB
	5QrYo0DpHWGFFzJsig+HIoVeDAP6N8qaEOnfsIa53jjAusP5ZXv1JSnJ
X-Gm-Gg: AR+sD118J6NlaPBI1h0GorMJPDtG2uYDDavSyCLuhhuo3/vX4EyWJbDlVHdQUO+PqGl
	raKQB8W1deVRkjcfkG/LKBVgOxZ/95HfOCF9KfWoppdl60IwRXBB3QOccn6+CbMgdkrcCx96K1V
	lDoPTZom7PHuAH4lo0JhpIWN9HF5pltBhAmxAPzpM0Ys2aB00q1zkWX1GaC66S0HFcth754vh9C
	RJas6W9gIv+nvlB8uEHdoPFpyamnuDO5IPEZYORGP9glHC6kpnowUzL8V1i3Cj3n2HeJC4x5r0A
	FERsPlefo0clSiRqE00Z6kTQcKvw2o55WUFyGnn2RNdu+bWagbSnvFS4yIWhOiKRj2cNjgQ0r0O
	RDoOKkauhzXax/DKzjUkmg4w1jwgvgyVpN0Pp0G4UY58+/GPh3KnVjYPbvZvYLaYPi/0fgjfru6
	KoNoXkaeC0Q62gsI8OUn0c0eOaBFeUL8ypCswOd0lLqJuLvBT3J75C4I0OBjkktqvJ1HCGPIVMy
	5jmFAz2rgtE79JvqGZyogELeqzyLdUJ7jKYrIExNx4H5A==
X-Received: by 2002:a05:600c:81ca:b0:49b:47b3:d6d with SMTP id 5b1f17b1804b1-49b91c3b7c4mr35819775e9.10.1787872718427;
        Thu, 27 Aug 2026 16:18:38 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm89930315e9.6.2026.08.27.16.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:37 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Fri, 28 Aug 2026 01:18:34 +0200
Message-ID: <yogabook-media-ov8858-pahole-20260828.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apCUKIgOZMoeSAP1@ashevche-desk.local>
References: <20260827181756.2430054-1-mauriziocasciano7@gmail.com> <20260827181756.2430054-3-mauriziocasciano7@gmail.com> <apCUKIgOZMoeSAP1@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

I checked the final v3 object with pahole. Struct ov8858 is 792 bytes,
aligned to 8 bytes, with 4 bytes of tail padding. The xvclk_rate field is
at offset 8 and does not introduce a hole.

The original digital-gain explanation is restored and the existing
long-gain programming remains a separate helper. These changes are in the
v3 series sent as a fresh thread.

With Best Regards,
Maurizio Casciano
