Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862A03483
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 02:57:50 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id k1so9305599plt.12
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 19:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SFzRUhN6YLmKo+jXursxkunKR479Zn0dAlkG5jiWhjw=;
        b=m4N3+d+3cvNyaje23AwxqDEOcMmaksqK4V2NJRT7hEwxPQKfKKiCN4kH1G3UgA7aYD
         20pzzAt7PLoaxLaPG2W+gxRQTKGSCCL3ncxuTacW+bXg35RVAeS+DfKAFt5NCWLjR3h5
         ONCoft+q2oU6LHxfgsgg3VRGPOzQVgoZTTwIzisv4WZaP2RbDw0MC6sfRc149R4C+dj7
         eK7CL/ho+4rQnyK3cMKNGhTzGfbWg+o5zzx6rAmzXwp29ET5LCHi4FmZwTOwQsow6ZxB
         +yfxfxSIx1qSfXGZI8rMyyIDq5d9dPRbV57tsnWKbQShPEt4xmtlBAB5x4sgez/rXRTB
         YiTA==
X-Gm-Message-State: AOAM533j5Q9HYD2Se7IVUc2Etf6bcB2sy3yLRErxC0QoyFpGUE3yI1Au
	0g1QI52dc5Sw79Zrj2E8KZA=
X-Google-Smtp-Source: ABdhPJzldFKnrfj3e7CDNRZJLltOGnPwYmMzIK1MKjkK0sFTGZWcKCldhGHbW6FmNfgZHfM78rnouA==
X-Received: by 2002:a17:90a:c092:: with SMTP id o18mr691992pjs.3.1627613869863;
        Thu, 29 Jul 2021 19:57:49 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:3f66:df55:a341:f79d? ([2601:647:4000:d7:3f66:df55:a341:f79d])
        by smtp.gmail.com with ESMTPSA id c15sm221003pfl.181.2021.07.29.19.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 19:57:49 -0700 (PDT)
Subject: Re: [PATCH 48/64] drbd: Use struct_group() to zero algs
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Lars Ellenberg <lars.ellenberg@linbit.com>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-49-keescook@chromium.org>
 <1cc74e5e-8d28-6da4-244e-861eac075ca2@acm.org>
 <202107291845.1E1528D@keescook>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <0d71917d-967f-beaa-d83e-a60fa254627c@acm.org>
Date: Thu, 29 Jul 2021 19:57:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202107291845.1E1528D@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/29/21 7:31 PM, Kees Cook wrote:
> On Wed, Jul 28, 2021 at 02:45:55PM -0700, Bart Van Assche wrote:
>> On 7/27/21 1:58 PM, Kees Cook wrote:
>>> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>>> field bounds checking for memset(), avoid intentionally writing across
>>> neighboring fields.
>>>
>>> Add a struct_group() for the algs so that memset() can correctly reason
>>> about the size.
>>>
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>> ---
>>>   drivers/block/drbd/drbd_main.c     | 3 ++-
>>>   drivers/block/drbd/drbd_protocol.h | 6 ++++--
>>>   drivers/block/drbd/drbd_receiver.c | 3 ++-
>>>   3 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
>>> index 55234a558e98..b824679cfcb2 100644
>>> --- a/drivers/block/drbd/drbd_main.c
>>> +++ b/drivers/block/drbd/drbd_main.c
>>> @@ -729,7 +729,8 @@ int drbd_send_sync_param(struct drbd_peer_device *peer_device)
>>>   	cmd = apv >= 89 ? P_SYNC_PARAM89 : P_SYNC_PARAM;
>>>   	/* initialize verify_alg and csums_alg */
>>> -	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
>>> +	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
>>> +	memset(&p->algs, 0, sizeof(p->algs));
>>>   	if (get_ldev(peer_device->device)) {
>>>   		dc = rcu_dereference(peer_device->device->ldev->disk_conf);
>>> diff --git a/drivers/block/drbd/drbd_protocol.h b/drivers/block/drbd/drbd_protocol.h
>>> index dea59c92ecc1..a882b65ab5d2 100644
>>> --- a/drivers/block/drbd/drbd_protocol.h
>>> +++ b/drivers/block/drbd/drbd_protocol.h
>>> @@ -283,8 +283,10 @@ struct p_rs_param_89 {
>>>   struct p_rs_param_95 {
>>>   	u32 resync_rate;
>>> -	char verify_alg[SHARED_SECRET_MAX];
>>> -	char csums_alg[SHARED_SECRET_MAX];
>>> +	struct_group(algs,
>>> +		char verify_alg[SHARED_SECRET_MAX];
>>> +		char csums_alg[SHARED_SECRET_MAX];
>>> +	);
>>>   	u32 c_plan_ahead;
>>>   	u32 c_delay_target;
>>>   	u32 c_fill_target;
>>> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
>>> index 1f740e42e457..6df2539e215b 100644
>>> --- a/drivers/block/drbd/drbd_receiver.c
>>> +++ b/drivers/block/drbd/drbd_receiver.c
>>> @@ -3921,7 +3921,8 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
>>>   	/* initialize verify_alg and csums_alg */
>>>   	p = pi->data;
>>> -	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
>>> +	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
>>> +	memset(&p->algs, 0, sizeof(p->algs));
>>
>> Using struct_group() introduces complexity. Has it been considered not to
>> modify struct p_rs_param_95 and instead to use two memset() calls instead of
>> one (one memset() call per member)?
> 
> I went this direction because using two memset()s (or memcpy()s in other
> patches) changes the machine code. It's not much of a change, but it
> seems easier to justify "no binary changes" via the use of struct_group().
> 
> If splitting the memset() is preferred, I can totally do that instead.
> :)

I don't have a strong opinion about this. Lars, do you want to comment
on this patch?

Thanks,

Bart.
