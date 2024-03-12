Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A001C7A71F;
	Tue, 12 Mar 2024 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710253208; cv=none; b=vEnsNT9+T7zM0Tqw0tuG7tt2C9xyjFHsG/s5bA/3F7FfqR+ocOzAi/mUXbTadfVyY1Jt8/OAznCMLAbKjwOniYblh6HjSU+/9biyPVgrRuNIpFDL6bJ5ivieb4LoaN0yXR8PoOuempl98goS3mnCVtWdthXkSlFIlb3TT6h13dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710253208; c=relaxed/simple;
	bh=yLWkWNcxZrMOhG71dZBgbvL7aoLlVdcf7JRuDyoJaV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dS6Ls+6NjElE2vfcDII9UUSoi0xHm4m8teb8OC66eRYQsOPI5G2TfhBe1Z2bFkyaj6QglfPozzWhv2DPKrJkvhpETpkSatJ+9FJtYRVOzO2b2DSKD3ZybVRtcKFxnbWMmzBOaIANNUGXN6LrwxayysAMVKhhZz3xB5W1QTS6TO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyUa9Q+O; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyUa9Q+O"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2220a389390so11472fac.0;
        Tue, 12 Mar 2024 07:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710253206; x=1710858006; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLWkWNcxZrMOhG71dZBgbvL7aoLlVdcf7JRuDyoJaV0=;
        b=DyUa9Q+Oq4Py/IK3TDFSNhbxZIjeC5Kh8l1y1bZKr629T62BD6W2hX5E5FWRyBaimF
         Mx5MqcFA4AvcH34wmZwVEG9BfariU2Zsw+/3HrkkmIL/kje1UN5CGbrmgaTE+HSRRRVm
         DXWRrzrjJpXUdjkqJBetpWrajMOwwV7J4Fesf7oCMhIoOux2SZ7BtroVgXODZ9oKD59b
         UXwU8K3EoDJfKDXfhNDRmpqQ+VIN5N60MIDFJDGst31RkrLIXKc90MEBTO3VMbeh1t/r
         sNByaNv6m37xLBQlj4+sgu8Q/T3kGKTVnwa4sjm9AJJSen9ENREQy9d/z0rREkUJc9ug
         SwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710253206; x=1710858006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLWkWNcxZrMOhG71dZBgbvL7aoLlVdcf7JRuDyoJaV0=;
        b=Ufq2zMbyDm7FDfUK97iJnS2D81Vy/d5dVIfddkXo0RhHa5+AanOmz32LZ+mAcNADog
         Y8Kelqe+EGw9Gyjso9reXqV8/HlbAnSOzz4y1FSsgNt2hcIrGoF68NDVDz2cR0xnMPon
         cdwrncSo3yiaq2Vpl6vrKUWeFoO/i7OzQ5xm4hOcMXkZW1Pqvs0RR9SBsSW0RjmrLLwh
         CnGE1bMX1Maov4CaO6OmgyL5m+x9lclA9KwP++bTJ/VOA3nKTyXcxWDQOFqUpsePx4oN
         ZrPSx2xgsh9VP31UZywJnXvGs6NPrIUsVxs4GZE5uu0JDU2DTLIPpQAojbonTMrRjVoN
         ESVg==
X-Forwarded-Encrypted: i=1; AJvYcCWJiu8+R7cf+0rDwHXM3QYxUzxiQNXyCemzEpw/4zn0FUkWd+Fvmw9Gx85yPyWCCFFQlVzaQErYrZ1QfPnHKOd0U5iyPBe2S4tGUnXSF5nY7J7CWwo3qMQogZB08uXivm7Sf786WzEQtQ==
X-Gm-Message-State: AOJu0YzbTSWqgCE3Dp/yyS8+mu5mF5/ps7ybN9hyrJVIz6lJrnw+HkNF
	WrDthuPoDkye6dRs4OTJUigounfqtvhJySCxmSB6owz/2DiSMYskIsX9jsWVrL0+zkClSofHN6J
	2snMJoEeW/hcr8Z4WCK1nlYDE5i4=
X-Google-Smtp-Source: AGHT+IFUvA38hFpGRTEzMMcAC6G2tUkiK1zHM9xDi/u2h1IFr1nD2XuRavJOZMBSAUcKJZVn1eE6s7Aa5WzfRPjpDes=
X-Received: by 2002:a05:6870:b68f:b0:221:8858:b3af with SMTP id
 cy15-20020a056870b68f00b002218858b3afmr3909933oab.15.1710253205718; Tue, 12
 Mar 2024 07:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Ze9Ie67PCSvBU+og@MOLeToid> <6d643351-8924-4c86-9fb5-9951e016f5db@gmail.com>
 <b9cc75d2-3e06-43d6-8b70-38d1c97124d2@gmail.com> <Ze+LMgwYYK6LN79O@aschofie-mobl2>
In-Reply-To: <Ze+LMgwYYK6LN79O@aschofie-mobl2>
From: Felix Kimbu <felixkimbu1@gmail.com>
Date: Tue, 12 Mar 2024 15:19:54 +0100
Message-ID: <CAK=vLxLensipg0BMCW-r83+-tQn03XQ5naKOsPOrJa6gf8i7SQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: wlan-ng: p80211conv: fix indentation
 problems, introduced by previous commit
To: Alison Schofield <alison.schofield@intel.com>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 11:52=E2=80=AFPM Alison Schofield
<alison.schofield@intel.com> wrote:
> Please follow process for revisioning patches here:
> First Patch Tutorial Section: Revising your patches
> when you send a v3.

I appreciate the feedback.
Thank you and best regards
