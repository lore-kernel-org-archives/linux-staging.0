Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824212;
	b=Dk9vBV3vbJVbDZBzseGna7lChSL/3VGHDnYns9ltbwtmk78n5UfmkNBtCULmN6YNA458
	 81lw5M+HtgsdieqvKh+vO2xWWbJM3RrGm2+LmiJ76V1a6D8A2BdvmpaZc8ZE8dJuHzP1f
	 RfEIAY8UxAW6OuSXLjFu/fEGko7+t6Co6ON1shhbjuo37KZGaVpwy40ARbn2ZxJGrUJRK
	 qqm0fRDsHl2gGLGbwgAZ0aNS0KH4kRO9CeGXT3DP2sPFw1F3jpe/SbhJA1JaUePZlAPG/
	 nqLFmCEwv5hSbS7nZ8klyfdijt4uKpTMlPcK9cvtkOjefvRr9xBUeY8aEl/7Z3vHW9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/hcjQElUZt6LTvJh48jG50u5y9Z3BZvpWeXQnVdqzgE=;
	b=Aga70RcnCjgy/n8Juq7Rir1q8RjJIHx/yHMlVXPjPPLx1bzNyyy22NaXRhFDyheDB31Z
	 5AvQuYXEVFbv30QageqWbfuBEdL8g/Y8XEKw6IvlGvYaluty9A0GqAKKnMjfDNRXleR5k
	 csPlewSc3lVnCoczrY5VGtvquBOR8NhCorfNyNLa4hNIx9KF74TcJOkwkiFGRO5OM9Qtj
	 C28S2A8DrCOMpz7eMMrG9gVTO4e3EvwMzV1+LbJeyUzZweiUU6HrTCztLcwDknpO9j+Az
	 uSUz6edvarYmYfo/qCWxfVimBu8wEz6QacfiKFUbBaFROb7jpjnkk7cCiWcQADjPsOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=orJIE752;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843AF606A329
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 10:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843AF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=orJIE752
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso4333848a12.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 02:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824211; cv=none;
        d=google.com; s=arc-20260327;
        b=OZgg48vRGO1dm8+4HZ2tT0Lm6zfJljhINIOs1pyRwsUm4ORuiYYqBiLcATh3N1cLi9
         ZuhAx3Swz1wz2vdnTjuhmLc2G46O1pk+YTwZDWXs1hOmIGDNjrdjTiFeDieXMXGqwlpp
         nDMcJSfrJ7+GCliJ+aLSLuqeEVafzKDgMX+5fqPLS9J6LuEZJbMAuxsozPpxfYpn6QF0
         XXRxbTupvnvHKbUzPH4BBam43TN1Y4L+UJfrOed/80RWKWJleYYkP9s18Pc3Z8MgX4Zg
         b9hNNtbtEtAjCOinDuyjD84hNfWf0VBCAwzpA2O3/SiNklEalKd2raEBvAdB2BKQlu6P
         K50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/hcjQElUZt6LTvJh48jG50u5y9Z3BZvpWeXQnVdqzgE=;
        fh=zbLvGswcMjDpjO1lzAoi0eIf5OJwSwznoYyYV9VuwQw=;
        b=Nue8Twh8L8k7vUN/NlVv5UaLqvWdOex4lFwlNC6sRGJWAZ6htM8GbMfFAYKN+biey9
         z3MNuNMre25UNUPFb5K2HcgXcs7n3bLucXl9h5YcePFVhjN6jLLJPAGCzi2OvsRUicM8
         9tS/rlXhTitQZUWWuSKWPE6eRa3+GswhrllIhfN+LxDj9Pevdt/0GmbN8zT7cmpstsUu
         CyvfCaTUQlVB8GBD+113HaV/QJoIS5zMuK7D06U2zoJHBa+4pky9EUqjvF4rOWIN4N/F
         D86GE0wq/11NalQ8d22rpU8pO5ozxZk6lTF/vTRa/y+G4zo9z4IeRXpvYmxXfv0E4LWH
         AKfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824211; x=1795429011; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hcjQElUZt6LTvJh48jG50u5y9Z3BZvpWeXQnVdqzgE=;
        b=orJIE7526x3LD1M8wxOqG8lpBXyyB3r6mTbSzHPrau+dJkrH0APVR7kJV92z76aY5B
         6B9YqcXfrbUAttqEvDpmeHInW+TFnYjgba12s/yE2zzOolV3s7UpRZqjToyWH2Fu3Cgj
         Sw9/Pn+pfzJ+0rHx+RKZzYmNL6Unq9CYTf8C/3emRVSa4c2ttmajMCLWky6cHd22RwDE
         k58y+ADNTALnUJunAYCKmeRaR7koj9ErH525j2K8ukCGHh7ExcWy4/xGfQN2gYZUOLzZ
         zURGlug2Snj41oq/eMw/lDk86QjBYXwRBIyyLqsspyZsIRDJHjSrgmuO746O7sov3hI7
         2ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824211; x=1795429011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/hcjQElUZt6LTvJh48jG50u5y9Z3BZvpWeXQnVdqzgE=;
        b=DbMb+J3OCS4Qrz5lrD+DOTyZm8hJamJ1QPx4vynknZdK4uikMHdXvCUsJR1X3IXScQ
         4mNZY6DqNumr8yxfPae4fSep2w1hUR7n/Vq5iNHRC7Nj7wq3gppt7XJn5ATD8oO2H80d
         5WOaCDPrcBWRa0vEplRQ/wGZlDiQ7LEjpJJnIptmN4sfJMIPxJetOfYqlSFj219PsDTA
         MKOcST25waIHjAzD795tl2i1lJgkT4ys1YrpIEb9nxrt+DYemC/o1Ai6CfM+nd38yI5M
         38y8GwOdc9QR9/CxhhbQ9VGibVNZj3nPvpYGFxXIlbbQ2/i6ahsYhe5XSXO8u/7foYMj
         XqqQ==
X-Forwarded-Encrypted: i=1; AL+hErEF+gJvTz5qtT+qzxKrR/Q7UFdfjgMWlAV8BgSJBdrrWOc732JZB487ZCS7ZiFn3mVciB8anDY5TNKA61ti@lists.linux.dev
X-Gm-Message-State: APuU4Z/mgKTafvRU+YIFcl34OE37h18AfEu1bssFW95b34dUVjuDImc2
	hUomW/F7Sak8HIGjwPsXtrLEi9zy6w3EMPi1gfgSURpq81qpUhwdG2qiZqZgYM0a10AAX63aHzC
	bN9L7+3y3jPDIZs/Ajvthfzh6C9TxBxw=
X-Gm-Gg: AYBFou11wXIXXynnWz1f/fmyaJwQDCUANR0j6DfADa8zEgMfzrXn6mUkjHAVMsU4ieh
	M/ht1f3YNYe4jouoyw09PoMEaZt6Fb+Py6dzhsR0rBbU/F26ydb8LFdfL65FEgn2CvT+uQjkOvQ
	vP6pCfN8sCJ45mtcBJmKtSDHNcgbY9lE0EOaI83fHE2WSP/wQw4Ydxn7XMZJTL4/AVvUpYC5EVT
	dYzDmCMKOmgmSMt2hapsrJx58QFLbu9g3XivJD1SRSzws95EGxaN5Kcs74Gf6V5SAPo1Ii1h89h
	Rg6PDRIBkT3DDO+E0in+phrewBE1yWWiMZdmCnzjsdYlm7gzM5gHBoecQt76y5TOZWWotZaPW5l
	BuP894fIL1krbAMhfcgtFARoeY7mtja1gkIZf
X-Received: by 2002:a05:6402:84e:b0:6b7:ce4a:7d14 with SMTP id
 4fb4d7f45d1cf-6b7ce4a7fdcmr6938230a12.19.1794824210496; Mon, 16 Nov 2026
 02:16:50 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116065730.472784-1-singhpriyanshu9838@gmail.com> <2026111624-amendment-bulge-7a08@gregkh>
In-Reply-To: <2026111624-amendment-bulge-7a08@gregkh>
From: ASH <singhpriyanshu9838@gmail.com>
Date: Mon, 16 Nov 2026 15:46:36 +0530
X-Gm-Features: AclHuK84ZkCQqKswlJe7GfxEBWYyOLXH8NGQkY8NovdPigxLSpCfnkb_ruBxLQ4
Message-ID: <CAOjMKJwAfEkC+PmGBnYimjW4Q_D7ReWurHz8OS9m8HnYBpL=eQ@mail.gmail.com>
Subject: Re: [PATCH v3] staging: octeon: fix asymmetric output buffer pool accounting
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, 
	=?UTF-8?Q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 3:10 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> Please test this on real hardware in order for us to be able to accept
> it.

Unfortunately, I do not have access to physical Octeon hardware to
run-test this.

The patch was based on commit d5f9bc7360fc ("STAGING: Octeon: Increase output
command buffers"), which increased the allocation in
cvm_oct_configure_common_hw()
from 128 to 1024, but left the corresponding teardown paths in cvm_oct_probe()
and cvm_oct_remove(), passing 128 to cvm_oct_mem_empty_fpa().

If anyone on the list with access to an Octeon board is able to test this, that
would be wonderful. Otherwise, I completely understand dropping this patch until
someone with hardware can verify it.

Thanks,
Priyanshu
