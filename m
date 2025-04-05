Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC281E5217;
	Sat,  5 Apr 2025 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743862062; cv=none; b=Ki39Ra5w9xk3N4j73rWhjB6I+oDhhnIItYrPhX6AoiYMa1CQeE/0MtIG3qkygCHsH68on5MxLQ/cufn9Nb1AJEifxFvm6u8gUEFjYLXpkdA8t7Nt3/EXgrgEs3bEk74CwA2J68m0OvMqFJMDva1iccpZVE3EbdENpbKM6FdhBS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743862062; c=relaxed/simple;
	bh=TW/qFu+aWszAthY8Exk3Q7IfvRnYfk5DV3H/Ju136ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G62M6jGIM7zXsue7aGnYOrofnEyxfmAFk4bAumpIc+CViDfmA1BIRoIhaQGVHVlkzp2Sap2cYZu5dr6vLGhIhiTTKzsO+zqHZuz0+H4okGayiDOG4/PViFotSP72zfDkrg7p/1v85FL4jQN1qNbJsAr5/eHwWlz8lynTknh6a3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4Jg6E7m; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4Jg6E7m"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so4653653a12.3;
        Sat, 05 Apr 2025 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743862059; x=1744466859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HD1hZvcYFeFSAZu2X5kKQKqViTPGY7rCLuRuENjfek4=;
        b=X4Jg6E7mwsvxFWHHHAMDHnllZmhP3immswA8nO9KL9aDgtSoTe58qd7ZJVtB+0S0+/
         NePB58LabgDLgz6ecVwHR+agScxkUX0LE58KKm5II6msfTL/wgQfDSHD6iJWj2ia/fqE
         3jKemljelgKflXHAFeOovk7+Cokcrxhk8GO3gU0ARcOjHTKDjLWfbx3qW8I4eC4AQAxx
         DlcqMmT/d09eV5FAPJTlFg9NprNsdAc0xEtdBf0O5YwrGGYAE8TlPu1tP1Gh8FcDzQB8
         ghzCUt6ar8dvpMv5kx0/oU7etVHae5nIjpeyNbvl3wL44xBCqUuURxkzyXf29DwDDn8Y
         B5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743862059; x=1744466859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HD1hZvcYFeFSAZu2X5kKQKqViTPGY7rCLuRuENjfek4=;
        b=LEBtwavZCUEO+T3B22FZepN7xDrjqZCf6jGle218dHDCevWnwwA7IvhIsKgcFK+ZuH
         Vv5iprPBs0aBKTfJzCl3kfuGY1BNCAMWJ5egg+G0T9N26Ciq36FOo+lxrweiWlce9z+Q
         AqvnXFg66GGZh/gOql1Ygu0a6X6K4ftwjEgm2xBPBMDVGtMSffpijEQmorCYXng0niA2
         N257pZNbvjFo50GnlYTItr6p66tcakcGyRx46jzNEDx5a6FLoyQ6t4Eh2QdEpJF6mOY2
         re9xmCY/wTzXthRraet4ggkYH67lxf6avn0zSxsgV+hem29dIh0qHeGTn2skBvlmG9sm
         F+lg==
X-Forwarded-Encrypted: i=1; AJvYcCU0gmy+nRxUonG/T7zAFxcH23lZ16HyqAw2OlCiQ+INm2kaDrOl72u89btP1FhVe8yV4IQxVRaEh2M32P5b@lists.linux.dev
X-Gm-Message-State: AOJu0YxXE6929dvDf7k5skThCt1KsILJ82NgCGuTFTk7HBDPGWQjFF/q
	cVsvuugW1ZMiUUuNDWabWyQgKMhPK8MqXRUaG57czgQpX2g/+e9BOFqVsqSSJCfJR/El7Hp2KNG
	5EYWmUd2DLMOetpH+5/yGUHxlS4Q=
X-Gm-Gg: ASbGncueeWw6dXAfZE3gltJATtw3udmdbCGss5q9eZDRISaeBcVpd0cqdasxjzjcolp
	rvMZebU14f/p/itcTzv7hUNdPch6/q9IhwTI1WsB1m/bBXoxo0QsOLmZlZnalS772zCMeFfkjLF
	htQayTykNEyXDc4PbQtILsYowu
X-Google-Smtp-Source: AGHT+IHiet2f3bcaBonLcfoiGSUSwIRjRouGym86K7CJ0AxLO/11DTx1uk6spLb4qn3Yh2GsuM83+faO3NWHdwV5IP0=
X-Received: by 2002:a05:6402:5204:b0:5e7:c438:83ec with SMTP id
 4fb4d7f45d1cf-5f0b5d82c63mr3892267a12.6.1743862059139; Sat, 05 Apr 2025
 07:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743857160.git.princerichard17a@gmail.com> <2025040538-breeze-espionage-dc6e@gregkh>
In-Reply-To: <2025040538-breeze-espionage-dc6e@gregkh>
From: Richard Akintola <princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 15:07:26 +0100
X-Gm-Features: ATxdqUGdkNBE7aDC6Q9smp5nGGHzBaqpLv-oW63nuKZ7Z7aRYltMJjkqXnfZN1Y
Message-ID: <CAMyr_bL4Qo_eeVSHhy-_z9_PwcQAvD6N4jfqBb+rtN-Lj+YdmA@mail.gmail.com>
Subject: Re: [PATCH 0/8] staging: sm750fb: change function naming style
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, sudipm.mukherjee@gmail.com, 
	teddy.wang@siliconmotion.com, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 2:37=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:

> - This looks like a new version of a previously submitted patch, but you
>   did not list below the --- line any changes from the previous version.

Please, how do I resolve this issue?

Richard Akintola
