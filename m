Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878AC47CC8D
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076797; cv=none; b=ba8w9HtpOwaGY8l9GAPSYv56ZzVWHQtVwfL+kcyJid04/pBCDe6mnPXSoaGHG/EFpQj8Sk3dE8snCQk8R6l930ULt7DhXGAqqsJ0Y1zx65/qDiO4xVAqlenlhfZKYJdDY0CgTo/yWlk6agx3iivPQnXivQ4zfaVglpyZvmHqYOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076797; c=relaxed/simple;
	bh=vAqHJkJK8NybKzUEyFkNm7wHMeyR870vyueLoGzt3yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGQkvlSlmyngTVnewSsHIYkEvQ1qgT4ZfhS8eQJah2ogmA4h/vMRuGyo+Wc4WhoiQPb20azwPJu38x+PArkOxekwfvaRf+qzAqXRF6B50bRXTGDhDKficbErFAtXYbNwy12Wi+jQQpSJy1tY2P2kaguQTN8uRiDXPwi4q1NG1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JQbgVeZN; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JQbgVeZN"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f20513so3307499b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 04:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790076791; x=1790681591; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSk3TeVnQVuy0Nz0PmBxSCcv2Duz1teV8o735BciAQA=;
        b=JQbgVeZNVtHnTY9RrFOo7YJc7JLjZESpBEnGdTN0qEJ+p3fSgCqtfwdQJkEkUZU7g9
         BhJp4RjOCCETnexNny2g/0on6z7y0BqnJ1gckhoKMcZ2c03akVPRgT5fIy2KscvgZy4t
         /PVStPGNTC6E3Dl6HMNafNBriAA1gChZnswRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076791; x=1790681591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSk3TeVnQVuy0Nz0PmBxSCcv2Duz1teV8o735BciAQA=;
        b=AK82cQql+a2mk+dR6Dk4XnFYZcUIidFaftYr28HdoZiA72KfolmEsJzZC8chUK0C8k
         HPcdxEGWOCXJVCg8xzJdZ/o0t4apXYxjACH2090HeyUbU2RvwliyxnZYPnzw957Shapz
         nmGuY0z3u9C+8cFYIMy1WnnzPPggrr6FhlNB3VHxo/MA4usk7cOqtTgM65c6wqiuoycR
         jB6U+7r8kK38hclrXd+kZhBh8IEhJnHNNV7gRReTm/9eAF6DYJat4ArzhpAgePSyMVd8
         uNl+0yQcx9+EeDzB4uHvRqgndBF9gSDcxeETmTg5n21BPS9OS5xoMJcjC3aBWU5DK7vu
         jExw==
X-Forwarded-Encrypted: i=1; AKwUvByCxsMZMsHfYQk9Xj8vK1HGL0GQ1t8OkliWGat2iRcUAWdVXGfycVfolwzndG3e84fxw2al4YQtkF/lyz3Z@lists.linux.dev
X-Gm-Message-State: AFuF++lywxJQVwX8sI3RzF821xIy0xblVhFMiirT7Q+/UTACu3lJCPkf
	Ld909bFFzldRveng16igXjravUsSXDJEHjtc22eB80Psn081QEA+mgivL9Yry7l3NXDzFjxnKEm
	1mPTYmQ==
X-Gm-Gg: AYBFou20WTBOcsdJoZmWLLAP7fCC6R6QiEeojEU06pN4HoZZXF46Gh8/hbqx+JF70lu
	7dIzaXyAFvcmYKmf3qw9+4fKk5COfEKd7Us2tMAixyrdfRGLbdrcE1Djind7tjtREJofJan4NUq
	pF2PwsxYn0eeoRTSdTlmPq4aKdF0H0+Wk42lYRmqK+A7y1fV2DEL9X0BU1v5dvHRrSvYsPbipva
	kdQjbE233u66dKLVno6NqzAsM+crA+AeH0ZpIQGtY8639CSfa5LjOYjMPioAdYFLopGC7ve6q4o
	3yTEk8W2icM31qpLviRTDqM5Mh4Zm4jwSQRA/XwWJGYB708b7hhvDozyBQSBw5WXD86K4F6Qtkz
	FqW1ry4/YnZbnch0vspI7j1dmaeEap0dlEM3Do3hZWWRHi0LXnE3HDIN/E0Tsiwkj51OydJVWjR
	NJh2Fvd/Sbx1Tux/5MsKHeK+FmClGtufAiw39ayVi/7TV9qH6yHLNMMKBzavr/IARN8rzLyETYj
	t3fJ6n0gA89Z6X63NGsruziom2M2dXTCrmugA==
X-Received: by 2002:a05:6a00:ac86:b0:874:708d:b61e with SMTP id d2e1a72fcca58-87c8403cf10mr910398b3a.28.1790076791397;
        Tue, 22 Sep 2026 04:33:11 -0700 (PDT)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com. [74.125.227.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c324d0395sm681857b3a.32.2026.09.22.04.33.10
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:33:10 -0700 (PDT)
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso2767926a91.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 04:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByApnyWb1y4Nxlq5IjBabFGmB5n3tPBnMwLNwnCx75GqjI9R7S+uQPwYB0xyYoQtReE6v/rRxcj3AYpeiz4@lists.linux.dev
X-Received: by 2002:a17:90a:e183:b0:39e:6c6a:209b with SMTP id
 98e67ed59e1d1-3a0732aab47mr857626a91.60.1790076789532; Tue, 22 Sep 2026
 04:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain> <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain> <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
 <arJjxjiWVlnHhioR@kekkonen.localdomain>
In-Reply-To: <arJjxjiWVlnHhioR@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Sep 2026 13:32:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCsD_OO_7_ZQ0NvWHXRN4jo2Aqr-XGZamn3bCzwnZ6gmZQ@mail.gmail.com>
X-Gm-Features: AcwNN1XSEqnhRqXFFRQlQKzrgp_us5KopVV821iFq_cxHFRxG_Sd7N3TpS2PoSA
Message-ID: <CANiDSCsD_OO_7_ZQ0NvWHXRN4jo2Aqr-XGZamn3bCzwnZ6gmZQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <error27@gmail.com>, Ceclan Dumitru <mitrutzceclan@gmail.com>, 
	dumitru.ceclan@analog.com, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu <Adrian.Suciu@analog.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 13:17, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo, Dan,
>
> On Tue, Sep 15, 2026 at 05:56:43PM +0200, Ricardo Ribalda wrote:
> > Hi Dan, Hi Sakari
> >
> > On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > > > Hi Sakari
> > > >
> > > > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Hi Dumitru, Dan, Ricardo,
> > > > >
> > > > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > > > Can you check this
> > > > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > > > patch into that, otherwise v17 it is.
> > > > > > >
> > > > > >
> > > > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > > > that branch yields no warnings.
> > > > >
> > > > > Dan: any plans to merge these things to master some time soon? Or:
> > > > >
> > > > > Ricardo: could we use devel branch of smatch for some time?
> > > >
> > > > Do you know what patch fixes it? If it is easy to cherry pick I can
> > > > add it to our list of smatch patches
> > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> > > >
> > >
> > > Commit d12183645a31 ("precedence: silence some false positives")
> > >
> > > Sorry, I felt like I was close to merging devel but then I started
> > > another major surgery to the core and got stuck.
> >
> > Thanks for the pointer. I have added the patch to media-ci
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351
> >
> > Now that I have your attention ... :P
> >
> > May I ask you to look int
> > https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
> > in case you have missed it?
>
> I understand the required commit is there and I tried to push the Maxim
> serdes driver again but I'm still getting
> <URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/110822240/artifacts/file/junit/test-smatch.log.txt>.
>
> I wonder if we could have the devel branch there or some more commits...?

I managed to reproduce it also in my computer, so I do not think that
it is an issue in media-ci.

I would prefer using only tagged versions in media-ci.

Dan, how far are you from making a release?

>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
