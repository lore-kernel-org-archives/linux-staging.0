Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1253E31578B
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772393157; cv=none; b=dqcCGbQfqrnB+gPUf4QpWF7Y3wcoNFa4x1LLsHvESlClVrpLLeP8CIYnh64Ie8K18a8xgkbEOVE+vqZh4O+r/9vl7IxnJf8z9Y0r6OI6vy2TfYuF8q+xQDoyaP2lt94xE7+RXnHzx+JSOi5GV9Xsg/+lMQDHn/u0N2df8FIXB8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772393157; c=relaxed/simple;
	bh=Z/MHboePtl4dJWBHLUB7S7H68HVyOkrPU4cvBOFpSIk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QDlty8SaSRrwpbC2IrUlezW0CpKv+SBYGuEHFIAcjiBbTr5gBM2T1RUfgCIui9jhPK/iRAW4LyZHBSnGzge9bpSh1tc/VqIN3/S1dDUH8Bad7i6wvqykvkGYBnstrPcsdM14FoTMCu+UpGeCwKHRQUoz8xvK+L94tTulkH7URK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlJlFUwO; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlJlFUwO"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad79df972so3558283d50.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 11:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772393155; x=1772997955; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/MHboePtl4dJWBHLUB7S7H68HVyOkrPU4cvBOFpSIk=;
        b=XlJlFUwOGbLv16jo4E08+06cSDYUGi60z62kt2faIQoCJOu0Y4PaIRf8KGWSqlvYEk
         fyf7MpgtNVESNFnDd28mL2W0ju7Z6mLKRTkhqNNRco42INGtMLReR2GL3R5FcTYv2atj
         uu/tFaoc/U3y1KMdW3gZPhky3em8kRvgdhAXaBMfGL3+8m44vv4BToH3nFo3Ujt1Dyab
         H5qKIns74HwROLAXZWaEx3yHDr0SVaa722dFfqy5ZBTq11CixqDk95/da/nV2jLPLNhI
         phWCPyTOb6WC29QBdHpi6vmsV2TvrMidptGbxTst9fbl/5xusCO8vs+AWPk3Azl+H8Xa
         Dgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772393155; x=1772997955;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/MHboePtl4dJWBHLUB7S7H68HVyOkrPU4cvBOFpSIk=;
        b=inRNGjKx4U/uGcl6uDJnnbaOkGXnTrSOP/Xy/oZqNF1FOrqzAKfXJ+i6iAZnukSIs9
         Yovs3Zb3pD6fPW1X7Q9s1BndnXZdaBKErrkLmjcEmDiICi6kfT9UH5K5CXbnjYVnQcAX
         UN158PaT2KUgkNdjqqcqNRA/O+nNcOj9MgUUy1t1/DjIDWkEpLXWavwOS9gonHfMUyMM
         Sjs/10btKMsNkWJmc3eEs93woWrkCCVveomrHIEVjqGzlZnzRYgu7zaV+7Uf2k2aqnix
         T5w3Rw596Lw4CH1eyPe0nIoKVvJaE5U+mMisFN2KXaYthvyj8EX564jN1FKZZpEqyapa
         973Q==
X-Forwarded-Encrypted: i=1; AJvYcCXov5kFOkzf1H5HX4+qbnyZrWVVW0HHxudR3sEjykSsGeLYesqTn93J8f5kJTMOG07ec+FQbEo4JDJRATNJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyRyY8pAL70JkLjU0fSNi+gNKhX8vvvt6qSqjikVjtpbmoaFo2g
	dm2rd6MJejxYvWGU8mTVxGq3qL6/wH0rRzUZgVeEIy2PynxawP3c3qFs
X-Gm-Gg: ATEYQzzPLgrcY/dClV/320abUqyLuts6/mVfE3vI0gWafvbBx3kawhJJJ7IPjzo2xiH
	uDTCtSjzqPGbGXxANc2Zge+6uYFmReDogNUiaJ3Z1fRuGAhDV0ncqmbpftSUyEkOpI1vBl0kd6Y
	MHjo1TOqJOqwgCrv3p1UcooPahFuCn1EsQIf/6diQmk/2lQcSrdVd6uo4yZTVTPGA5pxzVgq7HQ
	xmE9w8KX5SFLm5s0Ttpg2Zihg5LIqx2VBEFlD7bQcvkRojEHsYLt3vthoXFV+92bGYacMe7/7yn
	YzpX9Kf2dzC6LQJmBzELWz4UphAI97LmfreDbSaN9MxD5iN9BPvpEZvuoDu6/b9Q2Fv9npu7eoh
	7rox14bkygW6PuE3+zfB93//7NlQDJ2eTyEBv5nqeUCaOwSxkAJr2376PiHMeIKu9W/J6jq46Oa
	i5zzgiInfkT1hUeC4LiQRhX8lvAPy0HmEgtIInNtKjfBnB4JoE6zOyKTuZLAOf3yg80+rUvXmxr
	gMRhcjm9UBoHi14xk4w0sw4YeMff0Eq
X-Received: by 2002:a05:690e:40d:b0:64c:c00b:e774 with SMTP id 956f58d0204a3-64cc23464ecmr6645241d50.82.1772393155043;
        Sun, 01 Mar 2026 11:25:55 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb763f145sm4805876d50.19.2026.03.01.11.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 11:25:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 13:25:33 -0600
Message-Id: <DGROXGWX17G4.1782487P7HLCT@gmail.com>
Cc: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: vme_user: remove unimplemented #if 0 code
 blocks
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Albab Hasan" <albabhasan276@gmail.com>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260228153809.15398-1-albabhasan276@gmail.com>
In-Reply-To: <20260228153809.15398-1-albabhasan276@gmail.com>

On Sat Feb 28, 2026 at 9:38 AM CST, Albab Hasan wrote:
> Remove dead code in #if 0 blocks from struct vme_master
> and struct vme_slave. these were never implemented or
> compiled in.
>
> checkpatch.pl reports:
>
> WARNING: Consider removing the code enclosed by this #if 0 and its #endif
>
> No functional changes.
>
> Signed-off-by: Albab Hasan <albabhasan276@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
