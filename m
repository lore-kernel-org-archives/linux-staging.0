Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11903793BD
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 06:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769668175; cv=none; b=QoWzNpa5nqbQc1cKSPv45R255nUFaDsyam0CNnQcMbwmZQ+YHX54Ghi3PVkUnYunAQqkvmw9aw0azWjStP5yaBwGuju5QQFgH5KFczZ7dW24cy55VOxnxm+oi43EjDtj/hazND6f+3LfXvXgG/E/7Qp9YqWpXhaAsEp/NnQPf4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769668175; c=relaxed/simple;
	bh=N9h6vwaKVIUjJ2pkG8X7lhazeTPFYuCM0T9JxT0q6d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApQgVKbG8oGCou4hA1NoLLAizm5AayiMJva5ttO7vfqWIShzwrIA9L25oe0kP83fcSsJpz0gaEWgoj0tFUiiyayd9MeDfK340KLyqqUMCtdTLfXYjD3TPB6l/ocCp8s5G6o7/f8iYYO6xKNdkl8RIHYHunEWeXqGeLOBzHLV+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s93Hm3OL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s93Hm3OL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4807068eacbso4413625e9.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 22:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769668170; x=1770272970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=puA+CnwxAlMqbOnhYN3pZRQlGRvX1b7vDRdIRgp2KfA=;
        b=s93Hm3OLjwCCxP4Q8urOD0jjwaSUGhNPD+ZQhgLccR08FMGsxxOR8+OnDIpM9RjMQO
         fRtgEGdO3yLJPUwYQHqyYMpQ1YH80QMB0BJrjb0/UDPIytS+NGFXTmRv/5ipa9KtfAGZ
         MX/Po3ob/SblUyHQHOn8u5Kikad+iiP2VhoPdxxFo3wE3qTuI490LbZxh7HlyJIEnjt4
         Fe5aWgN+m9yM969Nx/e1OwXYmqApg4Zk4MVvdBQboxS5OF3yDFZktEyeNESI8U52Y++K
         IuvIw7jIIpoEJePdAJHzSTxzh7GE0VR/bq5ew+diIzAZ/8dUwoD18Nrp/1lsXxg7fp0T
         URbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668170; x=1770272970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puA+CnwxAlMqbOnhYN3pZRQlGRvX1b7vDRdIRgp2KfA=;
        b=L54gXs2SsK701ecKI8rTZJCNahm+EZXy57lA4skxeiAtdw5tLkjjtpJowfg71oB6Oj
         EGXhMCvdL3SjURwaCoB1m7DpflPNijTrq+67fIVLyewhimBUKIVZPz5xg0heJQq6UBsX
         haZ8mU1U4O7OGJ/nvoxyjmrojKC5I6YHTWSSoXKAg5OwioTiTl3kCZJdS9GitKkDnMl+
         62nrk4KtI+z/8Ve/X55n2rCQTt2OF+48QdGoSzjFXIKXgi5SKtnHa3PTm1EePKu/sgZe
         IKdWK8CAI70t+v1iU9t2PpGZp8InJ8VAtAHL++DpaY3himnqKmqrhRN/1U3wNhACbWsk
         e/VA==
X-Forwarded-Encrypted: i=1; AJvYcCUQtpZwpEV4mMm4oEMG911HamIcbppHKzU/0ueAhlOwjgECdgJWDKoJGbntnPxf0Q8ctJJRNd4Up2JuJvdj@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2QGjomv7iLq+XkF/Lco5+XXS/sCkomdI2zjcoE+t9+VLSM6ur
	kv7CzgSepMidNMyGViKjCQf7yAD6wI+eqhx66csK+KM0sURRwE6oNWE360OmRh6knyo=
X-Gm-Gg: AZuq6aJhMuABdDuoh5BfKTpMQamAn8unr8RfakRy1sTgUD9kQ55CblNQwAzhGEwJY6n
	SEmG3YykPexDZu3aRl3PKa+kjoppu2/32XgL0waAuVEGIbF1ujKMmArjFRfe7X34DHRXwYkG/Wa
	WoXItABQT5cEyaUPQfQYhEQNeFbLmao6cyuxmd6rEppHMm5og/zxmjM7dBkIBAO3kSFBU6ftalq
	u3qz+Jvpbwmoe9a2w7dzLqV+Upy65pu4ojEpHQynSXx0BQITGpPGlzgoElVYS5IIKm2uQlyImIB
	w9uyUKdXrMw0wfukwaoqaJgKSWBKqDlmKm1SwT0eqT75riP/Br5OpzdA2QbesKyS5zBfbb4akf1
	+PiIcQOsR5nvRBXCyzFtW2/ZSRbWukIRTXO2C+NRo23+DtJFsRVCbPsIo2ubpk0nrYiJo9v78bN
	UVHhJ1+zwYvMMKJGm6
X-Received: by 2002:a05:600c:468f:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-48069c6948fmr105945805e9.22.1769668170238;
        Wed, 28 Jan 2026 22:29:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffc0sm130968845e9.5.2026.01.28.22.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:29:29 -0800 (PST)
Date: Thu, 29 Jan 2026 09:29:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ChanSoo Shin <csshin9928@gmail.com>, andy@kernel.org
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] fbtft: limit dirty rows based on damage range
Message-ID: <aXr-RhUXwIvMHYZI@stanley.mountain>
References: <20260128203938.962414-1-csshin9928@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128203938.962414-1-csshin9928@gmail.com>

On Thu, Jan 29, 2026 at 05:39:38AM +0900, ChanSoo Shin wrote:
> Instead of marking the entire display as dirty, calculate the start
> and end rows based on the damage offset and length and only mark the
> affected rows dirty. This reduces unnecessary full framebuffer updates
> for partial writes.
> 
> Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
> ---

TL/DR:  I suck as a reviewer so I would be nervous to apply this
without testing.  Andy is an expert here and we trust him so if he's
okay with it then great.  Or if some other expert could sign off, but
I don't know enough to sign off myself.


The problem for me is how do I review something like this?  Staging
is a grab bag of different modules and I'm not an expert in any of
the subsystems.  Normally, it's easy to review staging patches
because they are clean up work which does change how the code works
so I just look for unintentional side effects.

It's trickier to review a patch like this which changes runtime.  If
it were fixing a bug, then I could verify the bug is real and say
well, "Maybe the fix is wrong, but we were going to corrupt memory
anyway, so the worst case is that it is as bad as before.  It can't
make the problem worse."

This is your first kernel patch.  You don't work for a company that
makes the hardware.  You said earlier in a private email that this
hasn't been tested.

The patch looks reasonable to me, but it also looks simple.  If it
were that easy why didn't the original author do it?

regards,
dan carpenter

