Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DDD2C85
	for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 14:13:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id s13so37924181wrb.3
        for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 06:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Hw7z2DE+F8UBs0gio938IkOrZbQGq0DztTjnNTwE29I=;
        b=D8fdejX/rCNDBoHiV4LiynBJx18EM/ZjvMMkJpbuoSlDJdlr7b2U39xUO91b7HWq0C
         8ANdlnsOY0N04/lXVqSO1XMvljvxKTMljsm/omCsmStxLTzIlNGJKDkn4uL4IFDu1O7l
         yEiDYt4zoE+vkdWBsWn1lKOjOL0NBYRB/nxoyO/vxoLwWT9JMG+hwV7vYZfxwrgpR45D
         ZbbC8gU0LfHvQKbbZJo5yNirplHMDwvzqTdwVtx3rqZpMh4l1x2kCzfy7E4WBmjTy0RG
         +3TVBOxOlv1ajb/37JZskVapp3DRMgnhvrWsOTbAkNeybm+Pd5HHVUXmUmRJsilTZf7n
         jiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Hw7z2DE+F8UBs0gio938IkOrZbQGq0DztTjnNTwE29I=;
        b=cWWAmOJG3Ez4uvEWGOyqiMPT2vWMBLXtu/MS15QWGv955tZiyOnf2bg3OUTMhRoE+E
         zgEW/3b19ALS60pvB2hWHRkQEMkaVT7u7rTcrEpsm/Mvfc9PV41Ealk1HhEzmt7nEFH0
         1Jp4O7BxIY7EOez5yv9+Vw5iGN05+Cpmt7MwrT8VYKM8ABk/xcne8885V4Ywi8TJeXoU
         VzUJ8MtLCB0QwbfqqS7oRzjkakiMIlAibiwMrcEGpbdRY8fIDxHsjKD2a2TuRj0Aiv8j
         5qJHLHGnzz2S6ZAb8UpIO79+Q4TEBAXOfaYzZXZ1h9oqblOh+ITPkyEP9ZynyrfwBXYq
         cNsQ==
X-Gm-Message-State: AOAM530lq3g9h9DhaF70SocPbeeEx2jeTZqirFw2bASKjxLqHt6//nDX
	g53bIgsGKM75VMS2iP8FYuiVGQ==
X-Google-Smtp-Source: ABdhPJx6YJZlTa5B4GfDTwox4+qJjdQGXyHLa50AzCSZZtUd61i17/1U90BHUfQGFlbWjKTqNjS2Kg==
X-Received: by 2002:a5d:42cc:: with SMTP id t12mr9608486wrr.129.1637071980582;
        Tue, 16 Nov 2021 06:13:00 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id h18sm18751493wre.46.2021.11.16.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 06:13:00 -0800 (PST)
Date: Tue, 16 Nov 2021 15:12:58 +0100
From: LABBE Corentin <clabbe@baylibre.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v3 00/14] staging: media: zoran: fusion in one module
Message-ID: <YZO8an3L6gay0isM@Red>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
 <a85c93db-e118-274f-d86a-d127c7399926@xs4all.nl>
 <YYKxTrWI299pvqo7@Red>
 <2bbce7ef-acf8-3c0f-2705-09d34b2d92be@xs4all.nl>
 <YYgAb76mrMb1ERMW@Red>
 <87357802-1723-0471-d963-252ec54ececd@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87357802-1723-0471-d963-252ec54ececd@xs4all.nl>

Le Mon, Nov 08, 2021 at 09:21:22AM +0100, Hans Verkuil a écrit :
> On 07/11/2021 17:35, LABBE Corentin wrote:
> > Le Wed, Nov 03, 2021 at 05:29:46PM +0100, Hans Verkuil a écrit :
> >> On 03/11/2021 16:57, LABBE Corentin wrote:
> >>> Le Wed, Nov 03, 2021 at 04:21:02PM +0100, Hans Verkuil a écrit :
> >>>> Hi Corentin,
> >>>>
> >>>> On 26/10/2021 21:34, Corentin Labbe wrote:
> >>>>> Hello
> >>>>>
> >>>>> The main change of this serie is to fusion all zoran related modules in
> >>>>> one.
> >>>>> This fixes the load order problem when everything is built-in.
> >>>>
> >>>> I've been testing this series, and while the module load/unload is now working,
> >>>> I'm running into a lot of other v4l2 compliance issues.
> >>>>
> >>>> I've fixed various issues in some follow-up patches available in my tree:
> >>>>
> >>>> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=zoran
> >>>>
> >>>> At least some of the worst offenders are now resolved. Note that the patch
> >>>> dropping read/write support relies on this patch:
> >>>>
> >>>> https://patchwork.linuxtv.org/project/linux-media/patch/4f89b139-13b7-eee6-9662-996626b778b0@xs4all.nl/
> >>>
> >>> Hello
> >>>
> >>> My test branch already included your "zoran: fix various V4L2 compliance errors"
> >>> I have quickly checked other patch and I am ok with them.
> >>> I will add and test with them.
> >>>
> >>>>
> >>>> But there is one really major bug that makes me hesitant to merge this:
> >>>>
> >>>> This works:
> >>>>
> >>>> v4l2-ctl -v pixelformat=MJPG,width=768,height=576
> >>>> v4l2-ctl --stream-mmap
> >>>>
> >>>> This fails:
> >>>>
> >>>> v4l2-ctl -v pixelformat=MJPG,width=768,height=288
> >>>> v4l2-ctl --stream-mmap
> >>>>
> >>>> It's an immediate lock up with nothing to indicate what is wrong.
> >>>> As soon as the height is 288 or less, this happens.
> >>>>
> >>>> Both with my DC30 and DC30D.
> >>>
> >>> Just for curiosity, what is the difference between thoses two ?
> >>
> >> It's the DC30 variant without an adv7175.
> >>
> >>>
> >>>>
> >>>> Do you see the same? Any idea what is going on? I would feel much happier
> >>>> if this is fixed.
> >>>>
> >>>> Note that the same problem is present without this patch series, so it's
> >>>> been there for some time.
> >>>>
> >>>
> >>> I will start on digging this problem and add thoses commands to my CI.
> >>> And I know there are a huge quantity of problem since origins.
> >>> A simple example is that just setting MJPEG as default input format does not work.
> >>>
> >>> But since it is not related to my serie, can you please merge it.
> >>
> >> Before I do that, I would really like to know a bit more about this issue:
> >> can you reproduce it? Is it DC30 specific or a general problem with zoran?
> >>
> >> The problem with this hard hang is that it is hard to do regression testing
> >> with v4l2-compliance, since it will hang as soon as MJPG pixelformat is
> >> tested.
> >>
> >> I would feel much happier if the hang can be avoided, even if it is just
> >> with a temporary hack. It will make it much easier going forward.
> >>
> > 
> > I found the bug
> > 
> > The null pointer deref was in zoran_reap_stat_com() due to 
> > buf = zr->inuse[i];
> > ...
> > buf->vbuf.vb2_buf.timestamp = ktime_get_ns();
> > with buf = NULL;
> > 
> > It is due to miscalculation of "i".
> > 
> > I will resend my serie with the fix for that.
> 
> Excellent news! Thank you for tracking this one down.
> 
> When you post your series, can you include my patches from
> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=zoran as well?
> 

Hello

Yes, I will include them.

Regards
