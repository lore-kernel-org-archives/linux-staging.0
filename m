Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01DB25B094
	for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391466; cv=none; b=WBT4QGMqXKIOYL8jAWHi9Noca3r86bGfy3jyFxZUWdjocUyP2D7bDoUVltiuotPoDS0SLMf1XQuXrQp7dpCWsJGFMC4ckAznUEnyKywLkFKBzl/nUnpB5zkbgz6YQS2wt2gfxFdyj9U1rFQWVFAx09q3kLkaz+3TOVH+xprkbTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391466; c=relaxed/simple;
	bh=iwfdzr2iy+sC6+czneLHwr8xAhX/X+iDimNm1BSeY5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsKVnHw4jFWRMzAelHxeJaLindHKcXp4FeTLmrNohIiT9F3rVsp1oZG0Kf3CHNBTYxUvelr2DwPYBYgmniu+1YwmkBKVrjkLP9U5x1juKWLYU0lKuAtuWeEVCilwBDwnfd6Qi7KktGYDBz8s+ZzuzhrDV+LQVcHxDCMhEpuMd+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDmVexJO; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDmVexJO"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c25420fe973so549745866b.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391462; x=1789996262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHHo4dn4rFwPjLFZeXv9ABL/gp9nPfJCU+f+sXBzG+Y=;
        b=cDmVexJONrrO+0bCmEQCoHGkRG5xBvVvC9X9fbZznsieSl3UC15Tqkh9nTNQJkYD6G
         S7Ahl5brtVDq8wydB0A2oeKAjg3NU5ux8XEIBPavZOywzzdbJf0yqHzRWo3Kxbha1xQR
         KcQMcjMIzM/nxhggmV4fdamLbO2YDIjrwqaC2vipWRScjPsq8yz6PF60HfMd+x0EmtTf
         qiKTzXBg6tbr6De0wC4xveKKD+WurE31JPAJ9pspG+YXe5TFaCWioUUkuoDT7A4hlq0o
         6l6AiI5udg/hAV4XrDotUVpbC2XRhosgHnZTeoJGeRlfCV2SQoCk/kd4/3zZVnBMr66Z
         +3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391462; x=1789996262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHHo4dn4rFwPjLFZeXv9ABL/gp9nPfJCU+f+sXBzG+Y=;
        b=EEFyAtvD06P+4d79Hl5A4OQssS2SzpkNHnSruom3iibzB5YIqPVWc68l6bMY3rqDbd
         HIuLZXGY9z2UQEgiL1CrlDDEudy+6tVBcK3wP9j+hptG2AFvOIf1KxOGtkgv++DlEjcN
         pnZ19ZEE58OBAbbjnVofsC39jvN4juosVYTUkQ6T6rSymy1ToDlJaOqpnNGyAtkEKwJL
         gb5ZF42VRUbcp0gKIcPih7gXeULXMJjlbaA1pYKzubcqqqUt8dywNiGgLYMmZl2BY27u
         cLKCMd9+92C9J2k5swUoA9AVayaLy/j/F0U6qgF+yDNYF7s9psyYZSwg8FfXsAX2VG34
         XFbQ==
X-Forwarded-Encrypted: i=1; AKwUvByPKeOiSHeF/HMRJRgftKRKkq478oZyzTh+l3xAgsryK1c31L+HQ/yfqgA0+elzx3dmFlLQwjA9VrSQrDG2@lists.linux.dev
X-Gm-Message-State: AFuF++lOc4RI/paO0/TjeteZoru2EkEgoigIFLFiEjiDrJJ843BQaTC0
	CoUFudWzXezJZmN68H3/DPAQ/KhASJcXP3APNI6uKRomWjMPnbc7s1tN
X-Gm-Gg: AYBFou2rCf93FqSnjLtrV0F4zORvMYMfSqBAmFUjGYYHGXFf/fVI2+PEHGpVmFKoZqX
	GuzPMBOTuWovZQ5eAzUpeveDFzbm70PbmJRdKs4R25aEZ8c9P8kZ3IAcEIhZWQSxQ0uH98UsOLp
	RTknlm7V/YNOb79xNTYHmFezCytWPQ/k718gcOpBiCJiasqyBWKg2iQatb7SIu25AKGmfdWgA4f
	/kNDtPJtHjwta+t1v+HJX8DY/ocHBnrQ3BNiDSsSf2/kqa3Rgm1IoPlTw8U66VyvN7kfAhvQKKC
	XnkJhiv+Mh1nBH7Dd+KizDXPdl/Jt9hyiGRvUr083pP52MCOKEcSM0SItNcMnnG4cn4JjeA6xGI
	G/tLWJi3SMg1o3L2b8gR2H99BmY3spt89I3eo9tKQEvJrcLr7HpejAhluK8vgIxx5hFDIxluCCK
	b8hdRskKOmXxyzLOEAECtSU9AFfzeHVbnzodRG23gksPXZFacetwtyOM1YlSv45judB2bKpRSyD
	mTJWw==
X-Received: by 2002:a17:907:f497:b0:c26:19de:912c with SMTP id a640c23a62f3a-c29b86f1102mr156986966b.31.1789391461783;
        Mon, 14 Sep 2026 06:11:01 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021ae8sm429403566b.22.2026.09.14.06.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:11:00 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:10:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ceclan Dumitru <mitrutzceclan@gmail.com>, dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <aqfyYSagcejWb4xD@stanley.mountain>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain>
 <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
 <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>

On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> Hi Sakari
> 
> On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dumitru, Dan, Ricardo,
> >
> > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > Can you check this
> > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > patch into that, otherwise v17 it is.
> > > >
> > >
> > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > that branch yields no warnings.
> >
> > Dan: any plans to merge these things to master some time soon? Or:
> >
> > Ricardo: could we use devel branch of smatch for some time?
> 
> Do you know what patch fixes it? If it is easy to cherry pick I can
> add it to our list of smatch patches
> https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> 

Commit d12183645a31 ("precedence: silence some false positives")

Sorry, I felt like I was close to merging devel but then I started
another major surgery to the core and got stuck.

regards,
dan carpenter


