Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8DD318B85
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 04:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775016811; cv=none; b=GiMDyCG+N0UsE/C4BaaNaIphmHKfQBOaVIBW5+uC31hPNLzVzl5H4fRWXE5M/Ty571nwR4agn6LCzkM1QrKA8cnsq+rsWLTIsl8Plv6Cu5OVaizCzT8u6llC4rY1ICkWL9ZkcySpMVqTsOsmLZmJLeEArzjTjZNwkdcL/Uhtj9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775016811; c=relaxed/simple;
	bh=m/0Uiu+mJa4LKBI7sAWduJfa41x9b2wTIo28yDzSe4I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mxprCp71ZbC9P3d4dM07bfrQ11B6GQuPevvO5RuOls9pgvG52Q2FXhKglUgJTuhXHteQA4Yy5Dv6vxJsbdVkStdyNUuj2xZQlfK9Jj7p8crfca/fU/jyDuK5Z7nAqPQOG9i6aYEUcO4L6kJA5WrsK8hd1iJTv+7eZwrEWF5xi+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZB6v51Bq; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZB6v51Bq"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64fc6b21789so6910211d50.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 21:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775016809; x=1775621609; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/0Uiu+mJa4LKBI7sAWduJfa41x9b2wTIo28yDzSe4I=;
        b=ZB6v51BqacjQKUxEdDGibTrN4RWKBXg8Z2SkWpb5EjucYXKz0Epqseu1xOgZdntTf9
         a529EVg8w/wOaRmO9eGGXNNARlMES7EE6qJQEn+kqt34oOSF0D/hV/djuT9eCfAarLkU
         H3wwOQY0sWxrFxto1oR9eCamrM98YZSfhelvie+cSoMlDkYxZpCGEQPf0VLCkbThimyk
         /tqRL5PTrYY+3TQvYcZY/BIctlC4VKS8oqyb2B5SVX0JEQcjUIvGucCQauDQFn1GV1Xm
         WaCsZbko/PcwrFieFWUERJ3wJ+gUdQ+zqNP49RdcGKtQ4Rb+3ud3Sb069+JmyLza0CcH
         FEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775016809; x=1775621609;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m/0Uiu+mJa4LKBI7sAWduJfa41x9b2wTIo28yDzSe4I=;
        b=CJqyFSvd3xgQo1de9Q4tkUUEoctQ4u5NZ+/A6TWrippfUkWtFeLr0itm9l8glw50DT
         dX1A1cWN0C1br06e6eGToESaJha8Y+IgYY9HCADyDdgVp/JRPeu+Mu9kDhStMuZjEF+Z
         aDvSTPj7dHnlzA5XH1ibF2mrMcyR1qYXUkgPQw8kZg9582og5NnDKQCIE8FviABe9/OW
         LgPln23/R+N6x0l+XKaAhyIZyA0r829zOxwrL2M83zQ4hJjRan+t75f3gCavAu7hTmX/
         va9F+qD5c2TK8pBQiif/YdABRHy+0mNlajyBMQXuCfsemfafvGJ1nAJ5VLJMOsHoOMNJ
         Umqw==
X-Forwarded-Encrypted: i=1; AJvYcCWxkYybnRQWRDzUDkrFPEjqJVeL0lip8U1r/CK7juAyKxF3ALciayPZrTQ4wHsSReM2iHP+YcTu7VmjopvA@lists.linux.dev
X-Gm-Message-State: AOJu0YwkN9iYZQJrnR+/gWpfI5nWjvow/VBNRKQGv97vMNgO3otJNuDB
	2x/2ZS1T/EjLdaYqtg8lM6TQcAiifoaAKXSsx7gbm9P13TtSB2nj/wcL
X-Gm-Gg: ATEYQzwJeY+NWmzo2mhJzIEpjatYaKTjCQYElqxEvH/MTecWevpSSwLuAD6T2V2Ex04
	fa1x6yXg4Iq3FpuN4CFZXXrgTy13a4/yqyrtW+4AmG5Am57OLu5mn1Fmo3iMYkAJ1FBzEw9joDO
	PNJ+ZYQYLyfbp4fNiRS5/HyA2M4HIxt9c4rRXfXP6n5Joyd27G6FJLd40hritDuYcNr3VQaudAl
	6g9fR3yFBdOLen0toXeayJIzgucXhbFj8E9n69V30Q68FtSgBZFu5TAizBZHUcXtcbq90KrNkVM
	mCAHlFxWITKMw6OUCuEnechADsPtO0sdpDuOO87C/rmwcwPadNBdMi6Jq4kVkRlT+EoeGcWwCRR
	rOEltaieUFoqbBWU0QN+FFXlUTqkOUTGokp1RLoii4vJfPXIFLVvPt2dIP5VJzTsTQS3+61dov+
	t7pfD21Sf2NYAkTZCOZVqM9AMs2UbFwA5t/h9FA0j8S0VmrnOQOMzkjDDnSJkrBCwlWFYbo+hVS
	zOURB3lmfFU6PMB8vGWdd0X91hoHX3V
X-Received: by 2002:a53:c058:0:20b0:650:1724:f63c with SMTP id 956f58d0204a3-6502fdc1413mr1696171d50.20.1775016808715;
        Tue, 31 Mar 2026 21:13:28 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6500936f692sm6464380d50.19.2026.03.31.21.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 21:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 23:13:23 -0500
Message-Id: <DHHIXYFSXN6O.12C0XMSLK7NXR@gmail.com>
Cc: "Marco Lu" <mcl7d9@outlook.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in
 _rtw_free_evt_priv
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marco Lu" <mcl7d9@gmail.com>, <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260401034301.31014-1-mcl7d9@outlook.com>
In-Reply-To: <20260401034301.31014-1-mcl7d9@outlook.com>

On Tue Mar 31, 2026 at 10:42 PM CDT, Marco Lu wrote:
> The msleep(10) call is an imprecise busy-wait function in
> core/rtw_cmd.c/_rtw_free_evt_priv due to timer jitter.
>
> Replace it with usleep_range(10000, 11000)
> to save CPU cycles to provide more precise timing.
>
> Signed-off-by: Marco Lu <mcl7d9@outlook.com>
> ---

This has been NAKed in the past by Greg. Also, fsleep() is the new API.

Thanks,

ET
