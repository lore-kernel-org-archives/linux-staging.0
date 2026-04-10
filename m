Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76F63D9DD6
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834120; cv=none; b=JxAURH/IiSZFsmHZ95+CdsDCaBVUt1FNzf9BPDx5xf3poLIUbzKnnfCo/b4wZBuSa0TtHdoHBLKA+oOaZRyrhYTMXp3P7uYSyqYe14sNWdttaUbT6isfkQjBpvHftSjje9gjAMqH+oAsnBDlZuxAtLEEnAc3B3SLWC32WITfgmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834120; c=relaxed/simple;
	bh=ofkZbd9q1jD7FLW5qyUIMrjfqWmD/ZsavI/VihF96YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUXqADlOAeVOnNLrd9/2le51W97kxEp64Wgju6RGkXFk6U1/cgsFAtapyMkQiPMnvqQGuf8IFxdZY9UaQDNiBMj0Lcanwu1VDMjXtIkJOv9Mr2l6OI+Y37NOsatGO7v7c/ZZGzmW1XsFR/kGVZe4Xp++3gFh+BD7aVWK31d6o3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeIW34Lw; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeIW34Lw"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cfdac74050so224021885a.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775834118; x=1776438918; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EMnllgDDv7ayBSXMxYwdqHXzsm3JK40j5yogOF/r5kU=;
        b=ZeIW34LwzCf6QsZVd7/s9/yFciPE0GmMOyjqTVSv81qGYQVsRQnmIL7Wa71RENSja4
         WhUBkTiTpE7kuEW5DmeLrLMwZ+UOXqYnl+KJINfiYakOFWQpfjDY+mm2ZBjiBji/VlOE
         8FI+fy7waMHKqFxZ60ShwQhDQTF4HCF9GHstUQCWJS4WqKr+SFGS8rB+rm78SvUa+DkD
         DS7bXbDr9K9Et1DUWmokWt7cg1sFo2oMX+Sl2qoRocykES53RFlJ2MppzWNFY2MeuaAD
         dBHS2IXw/rVrQaukQH6Nqm3m46bhaaENyXpn+tqHChzzMY4KOCUZ8zKjL7gj3TAjpnVp
         WWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775834118; x=1776438918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMnllgDDv7ayBSXMxYwdqHXzsm3JK40j5yogOF/r5kU=;
        b=Dw8QeY44sbfK8PGfu2m4jW2iNB7pQa3a8KMPoZv8qh88grnXknTjHiARZtOd4Lrlnl
         HO3VWTbvp54/Qzlf6gDixyxQbcXf4pCNaHpu/n+uF5TjXpi0tTPljaFwNrEVtjBmhKVa
         nNbxejvfxKx/QCcYDV648O8uNilrvZA6ngYIHzKmWO086sS3TkqDmdY6Z6huIhLPoS4h
         GAG6hS32A4B6Lb7v/ZKWxcHyyF0FP2F5Z1BzwjEDB/z/nIqLrTkO0fqtuXYBTOnR9tPo
         IZdKA/ENwEz2PE9PDE/lXOPdfZIY0pYAJ97AF9ena+nNa/Ln35zDJxIFtAdGAwnAgOQx
         cOqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuSKucCsMyR111e37oxDHua2D+kvSIlTTrqV9OMMC98r7lVMbxH8XGu8MJSqiYSmwbS37dlOUSqKFIhGnK@lists.linux.dev
X-Gm-Message-State: AOJu0YyyVWAFYHLa6HMkC0e/A/7sI9iWVxLjxqu49dyK1Md3XG6uZoEj
	qYrQRI3LTpug8TspMTdiYMJL0hUCiSoDAhBpTRwQifBjOQk4WHdZZGo8
X-Gm-Gg: AeBDievulHlB/k2+Bc6H/65LDznsQ3T5w1+GaSwwsKLJJEzV07rrRdASYKv0eVj1LE9
	6wfLKlKcWI7G0vFHpIGyIzr04uM4A/Wt34Iu0MgzAkEe8ERCe7Jpkt7Iu0r7zvWaFTD86RIWLKZ
	kinJDNINcgCNjixGQSwvY8ALGDlg9kl1bhK5OuSOL3pgNjPiHqDf3vOSzD6sQjppmAc3EX1JEK6
	ZnwmVxMNrKcJx8AcKHZ2nJ5Xv4p0VkiWFqfSnKfh7A8b7j3Qc6iEIwS1zsXpU5gv0jdfxvzEvzI
	HrxT+5M41QY8aSqTe9y8W3d5MnirWVba8qWk5eQv41F2KZJVvGZwuZAkBYcGHafF8MNTQPOYRG3
	4XlJo5BShTvWxmD/v3Xp2/TKyatIaK1KF1aJ/TxhN0OEC1PZkk62quY5os8dD+pRD65KDFx21J6
	uE8dhatOwzEUn1ofL1GonGblsUhaPaOkFATVMoypMMCX8V0vU3NIo+R2i5QPhyDE1JBqVD/R7lB
	0CtO62JJYv5iw==
X-Received: by 2002:a05:620a:2a14:b0:8d6:efb7:ea50 with SMTP id af79cd13be357-8ddcfea0af3mr486596885a.57.1775834114784;
        Fri, 10 Apr 2026 08:15:14 -0700 (PDT)
Received: from localhost (mobile-130-126-255-6.near.illinois.edu. [130.126.255.6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb9637c5esm229032085a.38.2026.04.10.08.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:15:14 -0700 (PDT)
Date: Fri, 10 Apr 2026 10:15:13 -0500
From: Akhil <boyakhil978@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: fix comparison to false
Message-ID: <adkUAetL-26WVQGg@Akhil>
References: <20260409221122.77303-2-boyakhil978@gmail.com>
 <58EA874E-2ADC-4920-8ED0-802F3CF1DF7F@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58EA874E-2ADC-4920-8ED0-802F3CF1DF7F@linux.dev>

On Fri, Apr 10, 2026 at 08:45:13AM +0200, Luka Gejak wrote:
> Hi Akhil,
> I am sorry to inform you, but upon checking, I have discovered that 
> your change was introduced in one patch in the past. You have probably
> been working on master branch(one from Linus) and not staging-next. 
> Therefore, since patch wasn't merged to mainline yet, you didn't see 
> that your change is already present.
> Best regards,
> Luka Gejak
Hello Luka,
Thanks for letting me know, I really appreciate it. I just switched to
the staging-next branch.
Best Regards,
Akhil
