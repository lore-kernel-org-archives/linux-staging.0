Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2FC30CD92
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 18:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771699019; cv=none; b=bMSjK8GiuqMoViP9zTXHf3DTXuUy+XXzNvFpen/WbV7xR0ckgTpEoz/NANr3B5w/hScSsxo2rzosHe963vn1CYsgZ20/CCSwCs5Xte0tMeF6eC1sDZcqYZh6OfuQ4y+hwaFE1HFhjzTX0cs7QeJp4YraxidOsBS+9FcMfkctF1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771699019; c=relaxed/simple;
	bh=eQQCPwnyuGzMe93OLctJpO1zp2kcAzDAKpyvdmMpiyQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gxLMWiZFNNLoTCRmzA4MevyP7xmHWCyawtwf/F2RpHRYzvMFsz7kvhEJNt4wCDbFZXbcWqghyqHiqbIDMGCWRHUQ5YHWSUWh7qTSJZDuplaH6hyW6jo9TxmF8BX+2s7qKK0PKetQw/siY5g2dMWevDrm/hy16JIiDp+V+Ue29I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIPiSJFl; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIPiSJFl"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7982c3b7dfcso8811217b3.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771699017; x=1772303817; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQQCPwnyuGzMe93OLctJpO1zp2kcAzDAKpyvdmMpiyQ=;
        b=AIPiSJFlRVgokPaXKI98lfo8A6Zb0gudGl6NivwePSrKdn2Y4Ypv+y200kDDqUe/xI
         qDakaV64QImDSBqhdUyPLYZVH8Z43/QXa5ml388oPvqDDm5jX5KHZhrOdbxP0vmJCYgF
         KuJVupw1yoh9mvDP6Lb5YRXgenJEWWLC4zC1nmj7iLYwBV6Ng1NwdjhVriRPBBp/XGXq
         7qgzg1idg9FyAneyzHBkNNG3Hb1RfeH2GK1VZ5Urq6On11+NuSQnvePkZBcYOfp/FdrK
         nmNUJcqp3veLfBiLr+Fnq65EGtxBjc3vi3vH2UvgMQo1o1hwp1jl8e2Rba8yZdLlS8Bg
         gVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771699017; x=1772303817;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQQCPwnyuGzMe93OLctJpO1zp2kcAzDAKpyvdmMpiyQ=;
        b=BUxIsVuy+riOxfTaIGbY08mVPRFH9YjQozM4O2rohgIeucBgnRFEilQLG7k/4Hnh1u
         WrlC/YrpDBrmRiVebKgeLNMrMLuMsVRhuVsWWjqwmS/vynFHLNjxIeyFMeGpU+dVmd7m
         TAvVZTyuD9q9UcvC4Bp3Yts7BNtO5foKbz57mEUzIBvpHEf8hjml+jL5C8YsqxGG6jVM
         /XB65iozdn3AOGpLxs508c8rjnb6LUT/lEVriGfVvkzwx3PcauLTZ4xVwSZqyuEph29B
         Z5muObA8/ME7ibvwFzQjLGo6wktg4Scei9yNfdd8pgd9FPA2UJv7wsbQ6qCjPjaOzli5
         E2lA==
X-Gm-Message-State: AOJu0YzmPEstcmit9Ttqru3YVTGAe3mOxJ14Gp1Z7mE4g4yXYx3dQoip
	IWIK1kF1yMuYunmP+bl+Vq/2LwK763pNY58lhptrOxh9By60d+hnTgZZPlewDjtPm9E=
X-Gm-Gg: AZuq6aKgM7JhBql/1PBLwQRh/hiQWRkjCzORnR3leccr3BE1uuJQkLo6rYxwhsJgEqZ
	8nsLnttj00ZWspUxHC+wLWGOrE9bMmaZLZQLKCDakmhckA3JROeXkbFlmSwj+oy/XJCAXCEynBc
	Yj+ZhsgTvz4TOv9cL6mS5NvNufC6imqT6lasLkZEvA/O22hpLvxhVYbUcck/kHaapFKQjVxJvek
	jt4uYFfwhk0BaAuyMG3ng9zTolSDiwvP3y6z7Ro7w8tsSMNNFC/2lAwT8ZtFE8FsFNl013Wnt1D
	RxYg/RdBHiN2b8+Hio2Ev3ea/lY1jHcWl3/+LlcSvYlK04UTRYcOLFAqt3Jj2aq4I+ifFUk7yod
	p87ICkn81kmYhGlxKvF125T3OWukl2TgWjXM1IrK2Dt3gaClpYjCB39TpMgfrJoeLer5rO/pa7c
	HmVcyRmex3RvKoyOhp1p8aEgD9oRsO8f/n30++r485n2kQL0BCJ6vy6PPnHVL1IPVyAadCeyQbM
	dtFeDJhCUkt5Q5cOcLZSYMjFK2g6Yg/ulvVotvjaA1nx61bP3GSfE4sdyyAEXdmtF2SJMac7DpX
	YriECp4=
X-Received: by 2002:a05:690e:1188:b0:644:60d9:8654 with SMTP id 956f58d0204a3-64c78f70463mr3200336d50.87.1771699017080;
        Sat, 21 Feb 2026 10:36:57 -0800 (PST)
Received: from localhost (c-68-35-58-232.hsd1.al.comcast.net. [68.35.58.232])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c7a39ce5esm1252322d50.23.2026.02.21.10.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 10:36:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 12:36:38 -0600
Message-Id: <DGKUVNM9SI4C.PTSSM2DVGYA2@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix spelling mistakes and
 comment format
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <tomasz.unger@yahoo.pl>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260221120719.16147-1-tomasz.unger.ref@yahoo.pl>
 <20260221120719.16147-1-tomasz.unger@yahoo.pl>
In-Reply-To: <20260221120719.16147-1-tomasz.unger@yahoo.pl>

On Sat Feb 21, 2026 at 6:07 AM CST, tomasz.unger wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
>
> Fix spelling mistakes in comments:
> - 'alloction' -> 'allocation'
> - 'overwirte' -> 'overwrite'
> - 'indx' -> 'index'
>
> Also convert a long single-line comment to multi-line format
> as per coding-style.rst.
>
> Found using codespell.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> v2:
> - Added multi-line comment format as requested by reviewer
> - Changed "Found by manual inspection" to "Found using codespell"

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
