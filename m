Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5F0EAC2
	for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708852323; cv=none; b=JVSByg1279IE6Ex0lXuGDc67qvYA+/VtDYL28GtxyoxUdU+Tafc1E/s9ZQuIMhzVM2hpOa72etOKajV4juscl340RbMtG2Z/x5omzxQhobshlLsrJ20UHf09fmoGdGJYM02M84dsgTlxzPoElSroJdoBTs+G2iNQAWnL4ZeFiOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708852323; c=relaxed/simple;
	bh=QKZiQwmh22yTKv+ll6dGV/xEVkRz1se5lZb9VRo97qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hljbKIU/WB3AL+g2+6TgCbfPYYyhKdNn3XMbqPYcOg6hkYf2uTGtWwPHGOy8vf/8GfG/Mf1H4bU2bizr6QkxW1mF//qVo+d/khbbSOn2ou3VB+JXfUYU4h/SBeAN51hQ4+/RCwVGIpA5bfhw8ejrWWLldwgtrStNAAptqvgT5No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntbgnjAN; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntbgnjAN"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso2195602276.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 01:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708852321; x=1709457121; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKZiQwmh22yTKv+ll6dGV/xEVkRz1se5lZb9VRo97qc=;
        b=ntbgnjANS90eWcavEHAB96wTY5JUKoOQ21I/hxTYAUGoOAORWxBvGxDkBK5WNWs/Lh
         OIVzYdeLwnSZV5idvdcW98LrQQ1OaSFGkZHo9NrVd2BdBIAc3Hc5UVQVx9kTS6qIMW/j
         Zx2yZRb1ORtn/LEe6kXZHfA+lEd39qFWI0d6x4uW7uCMmNeOOsvEhX4en+XsAh1hduOk
         JBMUi/Oxdcg2QCnKUc95uqw6PWViQXvhJ33d4Exg54VcMDsypRDt9ftHY+zABCyMjjeo
         29Yv8gtfsb3DJH4KTr6bs6Tf4CEnfCdDpMp2O3CuHLw77SShuuFQgGMJiYFhpYdQL3LB
         bxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708852321; x=1709457121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKZiQwmh22yTKv+ll6dGV/xEVkRz1se5lZb9VRo97qc=;
        b=rG9fGxwHjqR9Nn4AnMnkhwIvDhybztPfJ4HjyXqIvDbLN0AR3lRw30fhMKRPOlLJcm
         PBntEmN9BbfWn1IApnAN24uBrFHRBOoQie552HXjKKDegErOLnvXVnGBYETYg+MQujHP
         jDKRdYrSrwDGN4cyINUO3xqExXl1hPL6BFn5Rsl2HTen+DI1GAl/fiU8EgoaEscOQa9+
         jRMt14CArkCyG2fl9nf0NrbdrVXFIxSanS/Hbk+oq4PoscjFsg3BzJNjhVOY11U5wuS+
         nXiIY33SrxSOLnaFpY1kmMn5JYuKIpMjvxB1ZQPyGpGFiDIChBdykUKgwfW+sVCOwFiY
         TDWw==
X-Forwarded-Encrypted: i=1; AJvYcCVAzXfEJAvEK9/Wb+gXvwS8W39NvJxkYH9g2mFqGCqjgais1r/jpEVQsIDb9BQKNR63KKk02EM7uVnwpqRdHRwfDZA/x4F45/eBpfovbw==
X-Gm-Message-State: AOJu0YwMwI1VY10lFJTUQpnep6PbLJBstT33ywcK/yhclCNDapGrnVkR
	cXdcBVEEMjPn7CpcQfbkgYQ+9FcvoSwyMbCt+pJrTB5hNxAL08xOLTTDnd6popb5ljx50VGQbms
	MFbpxnTqEuGYz8TMKvI727Y/E+1mEfTHVFrsLN2uD
X-Google-Smtp-Source: AGHT+IHXT2nRKN0Wwdr0ip21+sZF1bLC2Hvaet/VK2GJH61xMQZo7qYtjxHeLTh3NqCW/oJXC574aLFC5QQxZAkbKJI=
X-Received: by 2002:a25:7555:0:b0:dcc:eb38:199c with SMTP id
 q82-20020a257555000000b00dcceb38199cmr2234116ybc.56.1708852321036; Sun, 25
 Feb 2024 01:12:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHxc4buV_UieeVVBhua3vmT2+2e6qf2B9uoxpSPAg6faGBa=Ww@mail.gmail.com>
 <2024022427-abruptly-vastness-ed23@gregkh>
In-Reply-To: <2024022427-abruptly-vastness-ed23@gregkh>
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Sun, 25 Feb 2024 14:41:50 +0530
Message-ID: <CAHxc4bstSZ1EEUv4dFSdQ_r0SGYT_sB+eqA7aZjqFN=fZvhu_w@mail.gmail.com>
Subject: Re: tree for the greybus subsystem
To: Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, pure.logic@nexus-software.ie, johan@kernel.org, 
	elder@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 10:57=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
> Then the staging.git tree as shown in MAINTAINERS is the correct one.

Hello Greg,

Thank you for your reply.

I have submitted my patch against the staging.git tree, branch staging-next=
.

Regards,
Dileep
