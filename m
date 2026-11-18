Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992127;
	b=AptpDkxfY0TA+CV0hw+CTyliO7f02SJY2feOCpWylo7baxbEr6RTlMwweZTH4+ebRPBX
	 mcb6Gl+yA5FSEoVTrkggArW6xMzGbT5D2pmDfkLgOgGw9fNpU7jkXC/Cd/jq5l9Y9pDvp
	 LoXnpDbz6dZNTaMwhaJj3g/fLpeyx3/+KQSSJTtWzLQBCEan1gij/hEhS+/D2P1i7U02K
	 7tZ/AfqEVfJ3+CbvB98ZMKlSrO74p58nCk7YqatMEP8+lG0rML/fwZRZ562W/8lgI/dsQ
	 pHS7KZPwYnSUq1ZPmDKXZDV43nMUDJ/2qHnjGqGL79zoWjfZit/WlfyTcjMIwvNT4HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sdWZuaGLpzVJrXvF7W52XeKg9YlJvmOJLlOUHYiqWro=;
	b=Z7Q+4wSXV+m2tLXB0DCb34hVGGCfkjS8oTTgIYFfKLySIg2perhIlEiXQvlzZNWs+QLF
	 OSXknymJWXLIlvlwxkPRp4aAgyKRhA7Llzp+trHszeheMRAy6TgaeTREOcZjikdNFfo1C
	 j3TkSUeudggJD4tUrN47hDCvGld17tkwacNbzcIv6hkiqSuKjM3wo74MuKVSZRAosGEgD
	 KrjRXAp75vitqrAjS+4PBVAHjiwxTqjEbBOltkvRjFudrfjzeT2ekym2sQLlMCldayEan
	 N2ckbQo6W/My8Qn1Q+ZS7xYGuOEWCm98oXvesOJqLlGNR1x1+6PQ6DUnD11Z2hNnqDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MVCe2B4+;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B4E606A31C
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 08:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2B4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MVCe2B4+
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so538084f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 00:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992125; x=1795596925; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdWZuaGLpzVJrXvF7W52XeKg9YlJvmOJLlOUHYiqWro=;
        b=MVCe2B4+vnkvu5xAooM/fFhe0sz251l++0eZje83MVYd1iUNXstUWgXB/WEsCLXYLB
         3C4xV6Lr18KYdHJjSLhg8TosqcwIAkrfRVYqbayUY9JiasPN57YbX3LNRYgHXpXrAOpk
         F6AIxqgdlhhl1ug8ByuKKqLvfwIjFpEi/wWsYEURJVRUxFgP9HV32RgbpE4SEL1Au1Pg
         G0YLz/tn7XKIg7NBgOqfQKUgOKzNEMtiuuVILNnbQ5c1FTSj2Oz6GeSH4AL+CURQI31w
         J0HbHaMzpdGyCFsfoOSuk9Qw+9wRIiBuvwKhkxzyBCO2s9iUmd3JSS6S6MZ27+DAdlCp
         JfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992125; x=1795596925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdWZuaGLpzVJrXvF7W52XeKg9YlJvmOJLlOUHYiqWro=;
        b=g7JYPRYFC115mxs6/M0T0FpRleGHHELQWXuuX08HnCBi3t/RQEOnC9oK6iDr0kszIB
         pCrQ8Zf4FMGrtKBa/iEOI+f72YFXD+sevpeqdLp6IQwojSkF3TOtvrhRXSQkoolmc1K5
         94cVSvnJ1eTEZBpfN1OZsYuap+ExW1PfJn5MUIWPf1jIokSF9W2zc7Hd56KYM6wu4CId
         eSINECr3F7flg2hx89R/7PByrAFLECp6d+k0KMnQ2JMyBDRAkHA30BIdzyv4yhABsVD0
         6YP6eafSg5yUNhbbxnJRpJmxK4826AwiRBeEP95pxgdFAQKdjrf15VRE0Yb7bGCBN3Wf
         4ASg==
X-Forwarded-Encrypted: i=1; AL+hErEsa3NVVybuHbUQkE29u5KE22HgfneDK3LTqbkfJxX29fXmBvSl4P6iI+Nz2mWAr29OXHKf0hxoTgrkqSjI@lists.linux.dev
X-Gm-Message-State: APuU4Z9Qsw7d5kTgwjOZ472FGf51czSTgvDGeIfjW+DsIDKVG2h3PY4s
	0O0Opg6cJBktD6T6paClAYPP3uC1fWffqomkRIrzvl8f/QpA2BwvG8yS
X-Gm-Gg: AZFdTZcS/iIoKNwUA6W2TFLtqLcLdzpRDX1RDIClaGzm+3lpjrCV6a5swNUvVA81Ak5
	NhEdMy0XIp2pvpB5IPZSCZV+GuOS4F6zrX8jmlkw2wsE7gpWWcobdEps4LvwGGjTyRbmbME0bJE
	ppcNknl22rhQQ4xUJuAIrQVF4j+ENCb1JZqxL2sjrQm1Lw2m2nPxUodKFOJ3vsVe3/+5tZRMhY7
	S5mjJHQ2qLAmd+pRZIdrQTdR601ZpzZgDbfp2auvNkW0c2aHvZnhIMV5aW1Ti6xsAKWJ7g1Dz09
	e1PMaPJwRDAAgA8P4skgKTUK+VdWYHi5A+c/F4pl9CRq+bsnhbog+VfnbhhTyuvHS82W7aRG+W8
	t3Yi+/jNBtbuNtcTWERVeatGETZbU55z2sBl0FYLEjQwHtZKh4bDahjNXzQlFt+jSwIkDVMxtw3
	LllXkNkPAD1CyzGqxiW9VpDWZyVY0SjHfan9OMw8F7mcbxcfP/lkat2gMxBdN3nn0JdMsEuEvzA
	zEtwb79YiKTMckI+oXtBpFTq4QmUJm9hcOJdC6H8Poa8uzFY7E0YlLkEKDFD2aWg3LgievMcbUD
	e5NYGQgiYPaZGgU9Q1m4M+2lBA5mqz/BEnT7CaZC8XRmMHxb8dtslGddtWi3CPfviakuMb8f0nL
	nOC7CyZ+rJNDrzWzrnrK8QUuYijSGS2nB4D86vlMEYcEVI08y9X0IJpknwb8bj22hicXXr+tZoj
	KUPAj9N2YqL97z
X-Received: by 2002:a05:6000:46ce:b0:4a4:856b:3503 with SMTP id ffacd0b85a97d-4a639d16f78mr2630507f8f.34.1794992124965;
        Wed, 18 Nov 2026 00:55:24 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c39bsm3571713f8f.17.2026.11.18.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:55:24 -0800 (PST)
Date: Wed, 18 Nov 2026 11:55:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: add terminating
 newlines to sysfs output
Message-ID: <av1n9wRjlQ5VaYAi@stanley.mountain>
References: <20261117171015.218177-1-yogeshdangal66@gmail.com>
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
In-Reply-To: <20261117171015.218177-1-yogeshdangal66@gmail.com>

On Tue, Nov 17, 2026 at 10:55:15PM +0545, Chhabilal Dangal wrote:
> The sysfs show callbacks for name, vid, pid, intf_id, ip_devices and
> op_devices print their value without a trailing newline, so a read
> from userspace runs into the next line.  Other sysfs attributes end
> with a newline.
> 
> Add the missing newlines.  No functional change beyond the output
> format.

The output format is a functional change and since it's somethng that
user space sees it's an ABI change.  Just ignore the tools which give
wrong advice.  checkpatch is just a perl script.

regards,
dan carpenter

