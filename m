Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB42A20E6
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 02:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1649297104;
	bh=PCUUj9sh+ZXg8xzwNDbyH1JMDapK+OEbw32C9DX7m4c=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date;
	b=o5GitCTabYiZJK0I8xsYhZ8UmE6Ghu28Ul7M0F3WM4itQOAsmjwvjqcjZntS3Qvez
	 lLMQEU/KWlV4eNQOXriD26Ax/ksn4FNm3c9R7JqH3axhGar8qDya6t5LsQHfPb6LCO
	 fofruzF1UeHy0XHqFGJH/ChZPnpLMGCNDpDayMm8=
Received: from helloworld ([59.172.176.225])
	by newxmesmtplogicsvrszc11.qq.com (NewEsmtp) with SMTP
	id F12E2A3; Thu, 07 Apr 2022 10:03:49 +0800
X-QQ-mid: xmsmtpt1649297029tfj245p8a
Message-ID: <tencent_0D5C6E0E160AA0702025FDFF35906EE69E07@qq.com>
X-QQ-XMAILINFO: MyirvGjpKb1jSx3AS0EqrsEW80j37bKcqodxlAv3QiavnCt/RjzS00hoUWAvhA
	 IOCClT2yzvoKT9d3mbSdpJmk6HWk+5Lfwza9gmmbUCSMCIXRKSD5HnQ6jebInyoanQi56MVnI2oM
	 iHMjKA6r96nPsstWxs247KCatE26nfiiom23UoGCKD877Kv89VN/04cCqCfyS993Csy9UUQpoHVW
	 vLCaWSYWomWvO8UX2aCsmwK5OrkBdD7DCC8WHYWQsIuYYZa3wVQK2VlEoR+a3KWGLhIos6iKosjG
	 qmE4EV/RA0Hg5Ryu19etchAtyeqFF/gxIkL+Tfc1rT0G6WNeCwfZ+EU4EEfQjFWRFBJfTtKFz638
	 Yu9itb9lzIq/9Lr4fReGaGeMbgrns5cXTkWUiszs+tYArDX4dOI2w/PLvkpvwsuRXi2XTDMImxAD
	 vjW4DEodhrHr96zvoEGGrjhc/E0hc8CaSaHruQBx/bRQxwX1LbdJHaQTOmssOGYSOt/ZQ4NXA/eO
	 BiihNq+qEXrnMCGVdNpVQ5F+91f+7J2kVL4qyZ4sIc+grcH5vcljS6GCQmhITGD0kiOkV0UUw30S
	 XmZNtJp2xxAKisfM294nzuksHMFoVD9p9zgaHAPkQD77Oc5Nvw7+C5Sjr7uNKzpWbOclmmYOSN6a
	 fFHKTxdpsqe/ZuhFccpOZojYW/UY/RTORHGXbsHBkZQqU3Uz/kjDLWVnkmF27KhrY1d286JJrSXn
	 qh6NcmGMANnE+dnG0BW1ZVRGImU0uplZmUa1P1JljoPloz0qGJA5y2xUfc+U4U/pcSXTf7Mtf4O7
	 wnKOyeM2cPJvH1chxOq6ICcMMG0PjVnADOdDW+87SRcJr5K2MoRMffiTnghXLRolMeEpIq6GjHgA
	 vcj5Kb5VCnmCdrGMmNwUICuwTMe+H26OHsKUB5bIPU3ynlG5ppH/QgwztS4j3KMg==
From: <xkernel.wang@foxmail.com>
To: <paskripkin@gmail.com>
Cc: <gregkh@linuxfoundation.org>,
	<Larry.Finger@lwfinger.net>,
	<phil@philpotter.co.uk>,
	<linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <tencent_5AB92A7786438342357C5669E7BF0C249505@qq.com> <tencent_15C23F2EC8197361EE200714C54E78B45206@qq.com> <9c307f1e-aa95-08e6-3a01-825caba19a30@gmail.com>
In-Reply-To: <9c307f1e-aa95-08e6-3a01-825caba19a30@gmail.com>
Subject: Re: [PATCH v2 2/2] staging: r8188eu: check the return of kzalloc()
Date: Thu, 7 Apr 2022 10:03:49 +0800
X-OQ-MSGID: <006d01d84a23$ba562c30$2f028490$@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHFCzdkIZn1ahtT3bex/Ulo9ihwXQEIO4NAAgMPs9ys8c3LUA==
Content-Language: zh-cn

On Thursday, April 7, 2022 3:22 AM +0800, paskripkin@gmail.com wrote:
> > -void rtw_alloc_hwxmits(struct adapter *padapter)
> > +s32 rtw_alloc_hwxmits(struct adapter *padapter)
> >   {
> 
> What about plain 'int'? I know that s32 is typedef for 'int', but 'int'
> looks more natural
> 

I agree with you.
Since the type of `_rtw_init_xmit_priv` is `s32`, I directly changed the
type of `rtw_alloc_hwxmits` to `s32` (they are neighbors in rtw_xmit.h).
In fact, there are many places where `s32` appears together with `int` 
in related files, so maybe we can leave it as a future work to make all 
of them a unified form.

Regards,
Xiaoke Wang

