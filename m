Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B141913A86C
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770916382; cv=none; b=qPkvfnBj4vgalYob7kT+Ic15/jmh12RQy/SUG8jfBtYWnD23RANqSGEGi4bozfgaN7Q7+4yuh5urXA6CKlR13i3MbvKiRvZVs67cBZFgpCkTDSObGL5xIIq4E+9IVGgRwQPT9eYedYdwheWSqukT6tNa3DOq4P8tYjfetQ4SzyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770916382; c=relaxed/simple;
	bh=NFwa07h+2jvXg+N9XUi5IOZNEhHwYjB7OXW3aaTCW/k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=B3rE5mdDyBUnD85P+Gh5FDs64q3v9LiTEuNaVt95TrA8dlpiJr9WWK1dPmxiU/+jhch2PuvqamyjmjBeBUoEkloncldHsxbufW15KTs3oXHJY2/LTqgQ4ardYIWImTqtHItoLh+TRW7C3ZEV1PKOiFqM/1j29vDfU+ZZoiqPhQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROIbGb1u; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROIbGb1u"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-796d68083cdso725167b3.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770916381; x=1771521181; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFwa07h+2jvXg+N9XUi5IOZNEhHwYjB7OXW3aaTCW/k=;
        b=ROIbGb1utsA+8lU/uW7PkcEBi8ht6ODa3ZOOM2jrvIoKMuCCNUJloXA/v6JDzWCO7w
         17MkgXY3GVpClqOPh0UwONz0kYMAht+wUqP0kzhb6fCLHBQyYkLPtMDZSGZFyBvvPJ2c
         y2tXn4VvLqfZ9gJTDYddG7OoiPNvXfhEk+Drcp2lAiIQ6PDHecJvtL0LfjWzDt2I2miX
         z04mwVOrg0VEKVVRUXSIqCrZeeBdClO6OnufVgOWXucjoRGLrOJs+8BZUfa0fPGBT2xS
         ZFDYWxtqGZNgsGUlIfpfMH3YpxSaHUpbeueHpGDpYvvrFfrwDi/OhAeUnOfbzv6iHFVl
         FS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770916381; x=1771521181;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFwa07h+2jvXg+N9XUi5IOZNEhHwYjB7OXW3aaTCW/k=;
        b=ZJGY9QE2NyKMOMG54zs15geIzrTqrMb7IohWTRFzNCdZNmt7F3Ikmf7wTBqpj7PxA2
         OCJDlfg1uX2xU70YmSMnaka8+D1VGXre/qMgot8+tMIaLLmOVgHCMTaTA8+a0m+gBxsg
         /hBKGG9cMe8ARO+VnNaKGI2Bmnn+S2XkySpBAJWDHYTLxU8jJTy6dwhDztiEKoDgUmWP
         zOs6h2arLre57QlFuO1LCe3GfR5A9v44DvebD1TbFjQc0r7bZOWEcLYMjAbkURylTkcR
         IMcmWJZSelpQNP9JXQw1qq0TBsiYrCbGBOkLKxBgwfkcp0XdcKLxusDB0z8qKZsZZCVv
         UD/A==
X-Gm-Message-State: AOJu0YxNuieWQGkfBwVqvZiYP9vqmmBknenGTqPElpDvKepkfHIHIiXQ
	cD2xFs6Ll/BxI888lV0riBPmE1Np4OVZ3vpJgVuW3biIMOYlGDfwM3uI
X-Gm-Gg: AZuq6aKaTsjrHlbaCMNWRDbj45elvu6jBjuIIUXfqpCC5LGvbcPukOXRvS0E2Q9d2di
	aNiWr07yY8Ns3O6T56TbNc+Ou4WSZD8xGL85/9hvsclHyjRbWDxt7ZdpOz7rQKWU0oEcc8yAcdG
	gT9gBb2aU83OBFTc98KAUah3WmL9+d0KGEn1P2jXQCfUEsAVcyz/0Zv8T9ubJUvPWUnaaTudkQK
	L2HPQlw8Th1qN+B2oTdzPTqZ4xMtSusIHwRJxVkCsOM1h5TA7XuGzQjwskDN27Uu8Sbm5MmIH0d
	Ym2CR8QUt7Up/o3G0DcEq3kRuX5ycBHFx1jqLhMby17XDSVNYZcoGgaUFwZjiPrH8fIHaSMAOmD
	ucs64tKMB2Vqwfv9PDJvRt/8GkvPCzgx+7hWnVoLTM1J4a4L8421o3Fgmt+Y5QWc677RQF5FpG4
	2ZRsmUIYE6L8tCLJObeqn04zyMY7pE5KBHXTl/xTQu+pwJXrD8yKEnvDmOK5gJ3XiETTz4MyBYJ
	ofpgd29MMdZtUaupccF1+Q4EmZuPstt
X-Received: by 2002:a05:690c:e34a:b0:795:e46:4eef with SMTP id 00721157ae682-7976a99ec3dmr27608447b3.0.1770916380687;
        Thu, 12 Feb 2026 09:13:00 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16e7b0sm49693557b3.4.2026.02.12.09.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 09:13:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 11:12:45 -0600
Message-Id: <DGD5GJ2N9MRQ.1BOHKI5RDZ4WC@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase variable name
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Rivka" <rivkab300@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260212072536.2817-1-rivkab300@gmail.com>
In-Reply-To: <20260212072536.2817-1-rivkab300@gmail.com>

On Thu Feb 12, 2026 at 1:25 AM CST, Rivka wrote:
> Rename pht_info_ie to ht_info_ie to address checkpatch warning.
>
> Signed-off-by: Rivka <rivkab300@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
