Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40361DF751
	for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753001092; cv=none; b=JAJBQNUsT93ZIrcbRcjBBdHs0CvEWviTbLXXH6jw65AwK3GXAfnUPOpydJb2+iMc3bS+6cXe4Dxn3x4pgt5KdgYmrhwwIHfSe+NIBvweViG2OqnicwczsvbBA0ZJ8bbCpGwL1wFr2dMwvg0yRqKB1GoSofBBaudnMALC++bVfDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753001092; c=relaxed/simple;
	bh=UKNgJZREfFSehHVmGWlScbZTYhwHo9TCUqfy3LGsfEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EmVP7DFWtgTuxaP4f+hX72+Otd/4jo1PfOwfVVQ7DVHsqoOqujcLyBau0momPIO0XWVDA7hxjseNTIMUDtZ4fuE3n/3qcp6O7SR14XOWryCTsYpOJ2nCNRpu5kN6U8YlqsqHcFWiHQtNqfsUfXVVyp2CPbE9qZvR+CBmulvTfkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/6Z2zU0; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/6Z2zU0"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6facacf521eso31159756d6.3
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753001090; x=1753605890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKNgJZREfFSehHVmGWlScbZTYhwHo9TCUqfy3LGsfEI=;
        b=H/6Z2zU0uMDhDMlC/lavOAAtzbDIQtSjeeTrgyjo7bKPimZXPcO2zLte1oxh0Jkqkg
         y0fBtcUEp3CGhpi4wNmXI0Ob7ZrHyeAOcWTFIn++Nn1nChinrP1Ng5dVqK9aquBsVubB
         rJ02d3KK3pSc8Hk/Ff9CgPJ3eoLQm9VZ+OQ6i5uhdlBkplkjXOtA5AU7MSqJMaOozhQz
         m4G1aDV4VL/bCX0N3vyy2i4JhmPlDQcfq/nnM6kLur6wOHZbRgrgOKzk70N61m1HIqTH
         AfkjGQLiHvJ3rLP3Vo7QJhShAqkPxSbUSOrG/3UIP/znM9EzgWo8aKpeHN4lk6ehT+96
         KwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753001090; x=1753605890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKNgJZREfFSehHVmGWlScbZTYhwHo9TCUqfy3LGsfEI=;
        b=Y4Xs5b8lJ/m1NDmQyN6Rfd5we/oqstIeB/Xuz40pczSr4toNMKprKulZt2FGXfxR/w
         HWnPyHykpekJ/mcvS+QxeIj5G/p/Z1EOd2dAfRbz7YbpwwhmFxyAWCTECAt7jO7wUO8R
         jGvKAH5JccTQ/PPbj762IdHMkNSe+4JKOlNMyDvvYigdYmHfcWT/YW/B92OROpyyAu62
         Tp81UWo2LTrbCyR5D8AFKn1IpOjngX+KOywpGtBjolKwfnZJ/TrMbjo/DhNAFi7ItAA+
         xdjSiOcoG7BENgLBAzWgPnB5/65z01+e6zoqK6qFn+MhPLR215FBjbiBwIa91LTB4mVH
         dMQg==
X-Forwarded-Encrypted: i=1; AJvYcCVF/Gg564cIZEYDuB+N3OwagP4F5qN3NaFu5TjebbpKTpqhWh7xHxbhowb0txOZ5Z5T/7bJKtdCKgdSfS7Z@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj8Da6tRQ4j/Qr5P2et+aagU2ckd3bgnJm+R5WTUaow16qCL3U
	8VsrZTqrbgmgszixPTPxvHv/7+VFayZ8de5ZmWP6MfThW+Qf3OV4FxPk
X-Gm-Gg: ASbGncv3m54YVzdTdu5hp2l5rQ7zrdOeN7asdGcqCbH+OJ2v7XRBL4qxB1NuDJpwOWN
	0msGbq/ZJDol+Tig1JwVTaGjA0KIOERSJjWpjJcioPWlt2g8VrA0sRoUuFdfBp115bU/6VTOFu7
	4f89PYCqguGlRTbwNRVQeq5azL0bwdVvkfzcGjs0OFlmPOnXP2N1yRbwtdqOVxDcBPmmte6kOyQ
	a3KADmtmeuMx4KW7vGMKCURvBiO4fR3JpdDqecQ/fr1eaRbLSdh4DldtQfInICzKPDuHFgWfU+9
	e46Vd/KzfC1+pDPF7Mtnir8xnjxPlfq9PSFx3SnFE7E9Vu7R+P1AZ4yUhmcE2C1GqNm9dukATV5
	IYLByJ1jfnXgTbmOopmcXn2c5ONacCWz4s7IjiEPLwebk8rst/d4=
X-Google-Smtp-Source: AGHT+IEt26ex5gs36+PooHyGwBBsjJFkDd3jbDx6DGnMerjLzqdpfz44NkXxG+eTngxuvBHw29PaBg==
X-Received: by 2002:a05:6214:daa:b0:704:ae41:df2e with SMTP id 6a1803df08f44-7050744785fmr179861606d6.43.1753001089497;
        Sun, 20 Jul 2025 01:44:49 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051b8bc2f1sm26291016d6.19.2025.07.20.01.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:44:49 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: vivek.balachandhar@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: =?UTF-8?q?Re=3A=20=5BPATCH=5D=20staging=3A=20rtl8723bs=3A=20Improve=20indentation=20consistency=20in=20rtw=5Fmlme=2Ec=20=E2=80=94=20follow-up=20on=20patch=20strategy?=
Date: Sun, 20 Jul 2025 08:44:36 +0000
Message-Id: <20250720084436.246590-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250719230707.238377-1-vivek.balachandhar@gmail.com>
References: <20250719230707.238377-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

Thanks for the review and your feedback. Let's neglect this patch.

I’m following your suggestion to address one type of issue per patch, which is why I’ve started creating a series of separate patches, each focused on a single category of fixes.

For example, the first patch in this series, which only cleans up unnecessary parentheses, is here:
https://lore.kernel.org/all/20250720083332.246512-1-vivek.balachandhar@gmail.com/

I’ll continue submitting focused patches accordingly and appreciate your guidance.

Thanks again!
Vivek
