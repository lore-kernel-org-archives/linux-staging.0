Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B4212D21B
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 01:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772155914; cv=none; b=K0RbaU7WHAZqI47KKmTHfwJmCID+sc1jES4xrun4/JjmLu4IdfarjuIGjZ6WlM1FgEC7r9B0I3cu/ntToMBSdwyCWiJbdKZz5jFxgtcLFonDnON4+iJAhmZbk58XOKcyvKeOk1Wzoh19cbqmmnaxu2/poUjB0H9q70jHstk9iZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772155914; c=relaxed/simple;
	bh=aen3jyR0R6HP4B+Im+uZMqF225gjvc+VzUnzXQTyPes=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OPL+kKgWs6vF4ARHtfSC5Ty+AWU5NHLBdMQCbhtKUphQbWq+SsPNoD7tBpB1GrXKsU26ydfrN7Pal/j5uwJWfrBJinV8xrK8MD0l8kxpb/4rNizyMfdVll1ZOanA4o2TH5yURmFyHU3M1VyrmnVYegneQGuJtWZBjuXPn4+6ljY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsV7VzsR; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsV7VzsR"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79827d28fc4so15519937b3.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 17:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772155912; x=1772760712; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcBOqQN+lyo7dY5TtnXmsQxAHfR4Q7lGHu9pdpMDJLY=;
        b=VsV7VzsR94iEvXQSsdbmtB8PtPzTNkbBiSF2yWCee2I1XAqk74pIw0BJQrF22mTVgG
         PQmKAdPnLrtpsuRgBXHWnBU3zMW5OgU00kGpyJGgf98HZfXdk+hS+EBjEm0BTo+2hJiW
         2AG3Vgyrorvq6wFNtkjQj9csP8O61cJyckX2YMrlw1IcnkCtKBxD5HpW/kI76B4SJ/Js
         3AgeKIjGUn/sN5XcyXKosLONa4lIMRsdMulUAoKCHIo/ZMNeTA0IuXIULvePXpJq5bvy
         giUL5yZeLHdpMR88/k4rIZnRAJ8cy/mj5EdnMPpkrsXDsgsRdA3V2ZJWwqr7ly2OXqOX
         jGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772155912; x=1772760712;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcBOqQN+lyo7dY5TtnXmsQxAHfR4Q7lGHu9pdpMDJLY=;
        b=bTE9fc67LRgJIXnN+RvGy/jZp8pesfV7vPbYKwuaEEu36PT6DHnOAk7yVxAjNkULwz
         bN89aPOaB79+EI+Bkd/ZKCkkjkVOrmIbcdCV12Eos2BzIwZpgONmfzqd70Um6aP6PbDq
         GvPc+Wp3QqUMHACkCNagwnhyZ8Z/mQ9wV9AGy9+pApSb78JJDRcssgZWHa8eTmk7+VIy
         twvUw9Eu15Ln3maxT/pSN/DNRyI7/EMr4+ieLVBwipv9m2b9zlXeR4GCjSxZf0z+Y1ru
         4jdUDe2+O5nm07o/VDvgm1h9lrlQ1K/padOKWa65K5KUALZu80hcYbx4/MZqhryu3Uet
         TDdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh5Xyw6N6IHiR7XPfRN05hrZx7VLebhWX33cWyx6ol1aT06jUb4rXUmEUUmf96umlxKnGBQ54uO8o0l5ZA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz70MmEhQ5hoN046SpyW98a2A09ovb+KvEK9g7zpczplo1bs223
	IllJSAKWflnOY6bkXxLRWlwlgs3lZ5KhZiSlnFEDwUxpdnQxQyhmavGU
X-Gm-Gg: ATEYQzzMzxG47xssRp1pIcnhQzmZ6OJaigoxc9Du3Ei1eS9BCcD6+OBdvNDCXOQVZOc
	499Uk+16OL1kVV/jRSOiYJYxmOn1+CI5nPECYQqyTiVOxjMQgvaTCzqjCZ9Bb656xyMuiLW+Rb2
	lL2+ysxUvwDIbZ598s6AxtB4HuMdJHD0vsIqADOx1pPSiCsMDmmy0SquR6ddgdGnQNx87WYiA/5
	/HGiLkHpREF3T0fPMr7hnVsmPTfWxQE0lZ/ACaPxD5l1L53D4UaPZbCnaoZBuVivirqAnUx9jSB
	xyUB88oj8rhFhxv+MwaArVMCepXGdBWX9Gyp1Y0kp0VEyq0RBdAnt7ttOCOAI2BNaDhU1vMNtIb
	Bgz8mr1exYZoODszOg6Gl3rQV47q7o97bMtrs7Iaa8T+wi7l/FTwKGX0b5NIIWfAbdM5pZz6M3Z
	+t0Lqu/y/6qyHevLIgjXUGpAMEwXi//XLsL4ibZgnL3qX0ZOKVsL9O0KMmhCPOKnvNISVJtoP/1
	TGZm+1WoX2Yeh2OecqxzfYYcgwtvfPr
X-Received: by 2002:a05:690c:c50c:b0:798:730e:f01d with SMTP id 00721157ae682-798855cd79emr13892057b3.43.1772155912600;
        Thu, 26 Feb 2026 17:31:52 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c862e5sm15129057b3.44.2026.02.26.17.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 17:31:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 19:31:34 -0600
Message-Id: <DGPCU2QHDJOL.3NM7ITZRM1O1W@gmail.com>
Cc: <dan.carpenter@linaro.org>, <ethan.tidmore@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Fix logical continuation placement
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Mariyam Shahid" <mariyam.shahid135@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226093811.30659-1-mariyam.shahid135@gmail.com>
In-Reply-To: <20260226093811.30659-1-mariyam.shahid135@gmail.com>

On Thu Feb 26, 2026 at 3:38 AM CST, Mariyam Shahid wrote:
> Move logical operators to the end of the previous line
> to fix checkpatch warnings.
>
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---

...


> -	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
> -	    && pmlmepriv->num_sta_ht_no_gf) {
> +	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
> +	      pmlmepriv->num_sta_ht_no_gf) {

This should be:

	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
		pmlmepriv->num_sta_ht_no_gf) {

Also, my email is "ethantidmore06@gmail.com" I believe you used a wrong
email.

Thanks,

ET
