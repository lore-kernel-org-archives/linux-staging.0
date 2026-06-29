Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772283B27CA
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721554; cv=none; b=D/mMgtrY9V75BMOP9uifKl3I8aFGrwXpGWRKI1m1tJ7qM4fF2q/8Ikzpi3dVq9hvOAdbHzHiHgTw5PBOO4Pvl+f9j+Bwg1b1xfoMGkMSn7XTyC1EivJVYK0oHtKiPHCom0Y5UkasShfZTKdNyfOJs4nPgBrL6fF2btMwJF7CIMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721554; c=relaxed/simple;
	bh=Jvfy8BvYo0ZTKyrFa2+wvFpfCXois0NgDhBvaQTZoPw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=H+A0a5dMjqmsKViTR8FiuggGh7dq0AH04RTSVdNVX/bvvAEJf48RKiGCafSMQqkmyn8PDbVFtUIVRBLv0OWVv0pWpLOL03HzhSVEgEIeI0EWy61v00kAwEjMpewVkxH2J1eLYHkgIeH4LJXclJ6WPsVhw1WI0gMihaQkWRd9Cnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/HpS44l; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/HpS44l"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5285278eec.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 01:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782721552; x=1783326352; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWA59cSsBZjr2kKlyg3H/1yhWMTPEUomql+G1AWhPuQ=;
        b=Q/HpS44lsByQeflA1t+lqZ7uckYFQ8klf1+yRN55sxijR1E32+Wink2KmmHyU43yiC
         vuNYpcG/WQh1opCgC/SGNh1l/OsVaTldLCbDkJcnI/AlJshksyBpmZomg2XBKfZQl82C
         X64SPEt+uWaiWaDsBoOf+Bz+7xcirTNruwMyqvMXMXQsjI6H7j5mxvTzWWZplhbJfgfT
         aNdpochz2gpgCpoKc4SHOzfQ7W9KArJxT2/3Wl+MeldygWQcpVPCCAb8wbfiyGZkARtH
         qsD0vj1LjvBlUn0Vaq+TcH8ygAh+Bzpaer+n9zUlUYnavP/gl48XMpI6i+vHwO5BhSuS
         /uuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721552; x=1783326352;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JWA59cSsBZjr2kKlyg3H/1yhWMTPEUomql+G1AWhPuQ=;
        b=DFQ7AMRR31/SalI9kHAx/4rivGrrLZpYQyrNd2uVMB1OO9Ytc9xUjIdB4m079EmEEA
         x9B+EXViHAjtmqVZ+Cr3dKsbut9c7/mWVHKkoEy8ydoOOTCl1TQAnsvdwwaIZoifW22G
         Zc5awpefF+skgRNlFKcWzIEhEeRr3yFqPOvLTtn5FB/zkYJsE+AAM2PdUX9VccofkVSC
         VJN8tGPgMpoJ/kUZUn4jIg0CFZtKTYYKO/9CMtYrYrDm3R/SyLmVXqZHGt3Q+AEA8dYJ
         AyFjBOX70LUb54ixtDBWDmYiz1fyINbbIarpUqFAeymYSO38w+DDRR7KHZ4XwRrUIBAK
         X1sw==
X-Forwarded-Encrypted: i=1; AHgh+RqiCXqGJBOfxfVJANbH7CPQjr343E1uW3ICnv1Bcuc0Mm/qqAy/U1aLn4QyrANXnKSqLXnoKxkoA6Ir1n8U@lists.linux.dev
X-Gm-Message-State: AOJu0YzAlYR97qxQEXfQkjSlIA9IE1i0M2MNJ9IdOdmkup2OR/j2rj5N
	ml9iG7kGNjwNxRm6BT7yyxbH0UvhAYEFDTda8tmsZUJKA30SAAV+8ZJn
X-Gm-Gg: AfdE7cmlwOD1M/rjnrqPePFrsrhS9PeloLkty5A3OMYKaEsOCXUZvLqrXCUlERi/OVI
	KA0J3GB1/FSkjkzFfJAoA4wFzBdGtuY1Luqsnne17fZ+G8kt2k3zGlKXxpVSb1L43mBP/Z4N+zE
	UL9sjy28eMCYtVaq6PEgPz+u6ZrePBUieiB/RhlzbPwVFtRkFDzvHnkcDcjznyfspEhId7pCsAR
	SlheWp4EEnMJUqte8elIlwjGAEFZj2M+7PZh4DyAkOnO8ywVV5TzEW73hV2nnwRL4r8MgFmpTZN
	J/o24+lwAIYcvbsP+LKMJ6fOgL91qlGUvhvM30nMJcmDamMcFe8Jpg2rdrcJ4cKVSBBmKxs1TTM
	De8URF8cVtJyGAecv8LzLUaeAC8Fg0pGDBTi03YqlYsgByaq8Oob7kMdrHmHZZUdkWlXQqbexGM
	Ih2bdPKJmCneXzMazZKLEz22JXMpVfLh0wVXjF4VhSFSRERd71uFnke9GRGTcoKxNXmYs1R25Xx
	LjB
X-Received: by 2002:a05:7300:fb8d:b0:304:b14:ec53 with SMTP id 5a478bee46e88-30c84dab521mr14139857eec.27.1782721552452;
        Mon, 29 Jun 2026 01:25:52 -0700 (PDT)
Received: from localhost ([45.64.226.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30edaa20508sm1271381eec.14.2026.06.29.01.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 13:55:46 +0530
Message-Id: <DJLE1OGDMMV0.1TSDJRDW4Z547@gmail.com>
Cc: "Prashant Rahul" <prashantrahul23@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] staging: octeon: Improve initialization error
 handling
From: "Prashant Rahul" <prashantrahul23@gmail.com>
To: "Dan Carpenter" <error27@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com> <akIdyUhcH6O-Iczx@stanley.mountain>
In-Reply-To: <akIdyUhcH6O-Iczx@stanley.mountain>

On Mon Jun 29, 2026 at 12:54 PM IST, Dan Carpenter wrote:

> You need to say when you haven't tested your code.

will do, thank you!

> You need to say when you're using AI to write patches.  There is
> a format for it.
> Documentation/process/coding-assistants.rst

Thank you for pointing it out, however I have not used any AI assistant
for this patch series. I used Harper, an offline grammar checker, to
help me write the emails, do I need to specify that? Other than that I used
basic tools like an editor, make, git etc.
