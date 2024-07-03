Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22D282E1
	for <linux-staging@lists.linux.dev>; Wed,  3 Jul 2024 16:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023506; cv=none; b=RU3MQqtHs8b4UM3LZ7zFrwXyuGahBHWAc03TITuwrNqv4XuK25uzrFTkjtV2UDCHh2doqQxJ/PBpD5jhGYvvfgkP3rAC/NVzROBw5c9+Iem72nwui9cgTxS6TvK93H7tGJIs2jBW0inaOQ25YIgZswpsviro5y5ulGcIXizrkGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023506; c=relaxed/simple;
	bh=2z+TGx7QMHIKCmIXQq+Bn/nUCenZvJLLxL5+nNaYWbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujUpO3cHkaw2jUFcmn4Ipv30tvNZKw2mF+BthOc5aotlgTH3PG5IzYejf/q3IZZRC+JoD/SKYBieOiFg6xgEHszGxNVbDGROGjqr4jawXJKLINQsW7QuManqt6pqIrFktUYDdTR5bRRSPBsVon1aJ2n5o0fcqi/DTvkG8dJPCus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Vx0GBAIm; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Vx0GBAIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720023499; x=1720628299; i=wahrenst@gmx.net;
	bh=S261481X0OCiOW6cLDAPj0QS+stxwiiU3nvvLeBTpFY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Vx0GBAImx90Us+R4dNs56MP4KzIM+4BHV4+vSUK93qmbkTg1yLIM4JMzo6Fg59PH
	 UofFdz5w8lcgxvBA2r3ExAF+r/tTAr7m5JfmJcQswtRfNfGPZY11pRCxXUySIXVxN
	 pNJ81ehfwNQ5fE3eTJZgpMOokDoS8oo6rtPnc9AKqJNOAY+DS+vxROUSgt6cLqHxs
	 jcQHijZLZrT0+QclnReKkMIILnGP1y+F7FciUsoFyMHpe//hAcIRL8RTsaWjMOXEx
	 7R2zWIa5WMA5xLMrLW9ww2Ueqc21asLn19ibIDb59ST9eQhbeuvM8ka7GSAaQfK9e
	 Ge1j4fC6yhJCmEndwQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42jK-1sP2gV2ukC-001tMh; Wed, 03
 Jul 2024 18:18:19 +0200
Message-ID: <2a5c162e-0036-4f3e-b946-bce549e08c54@gmx.net>
Date: Wed, 3 Jul 2024 18:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] staging: vchiq_core: Bubble up
 wait_event_interruptible() return value
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240703131052.597443-1-umang.jain@ideasonboard.com>
 <20240703131052.597443-2-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240703131052.597443-2-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jTtX7DS+mGLKQD073ZYgZHIUcdwFDMDNmj6RAuqaPK3ChjqIQRF
 nupBLY8hV5el00x1NeGArjk6Mw4rg82gyhXhTLXeNGCm1Rl+AK5CWBgsmAbhpEFI9kwrgPS
 cg+8ssqI0ReVptNVQfUzdznttLlywfW9Q3vNLm9GpDWzJhU4dUKWcKt9TARQivlwbSTZXHi
 DfurUhVlSjK6vyRNS7LHQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sEgH91ZA0wg=;qXuNvqAjToRFe3KS8LTLMao49XW
 h/Tgpmlq9EMMTTyI+DjbuxsztgeARecUpZnh5FuXv1kXZ8BZtQ3W9yES7LaTgZUPBARDAOR6K
 7HTahztdpN/uTxvC6Wcnt8Rz8gIloaTCEq5kRZW/nlmOKrBZsN2VtidRPrcHFs8CHE+VKUTVE
 FbAR52J8+HyRjubdred2sBTV4CCxdrw8OmYlO13RcarzZTTGoj/hI8N86C4BwvB3OGi//6zAT
 PbRozI6CscvM/ofcX9oREmrmFRqkt2muEyPjyV7VSCBJDsx3xX4iBm5qyGRl7bHCv0VJF+AXZ
 w3gc33saO0EVe5hcQZAAAEhua5tKm9iZuZq99ajuaflq5LctD0Jfn9E+FWSnFiD1aJFQ9UWJ1
 IAAYKcvU/qZVGKj+jjx+TucquI4yuNU6l8Ulm48fM5mbgqqzH1r1Iqao+gv24rlTDaSzLb4jX
 Kk7XRqTJ5pLOuVPkwTK8mPmiAMu1al+nyys4M/FRSgJvyRutaAQOPbFCJLfIbt8R7bJNNpzyX
 jdk/swZF6xambyRZXEKjvGlnBaKfoTJXm7zv+51NJNQcuB6FusDm0OwANWhd+QGSCpgT9dsG+
 yViMUD4obhZxfX32Ay+G3HxjGwp7pnxvRSoaYQ8pB9RFDhsNfamdD24D8IB0S8rcrAk4J/gnD
 k32Ostt58CZ7EX2IBJ+LZsTxhCEiZhKUWqSi+BTcMPmD2tM7ysk2kVhPAHJKUBhkVr9AlWHP/
 +AIMqBh7ddAg8D8XBSq270zxnB7J+LK3NfKtlt4jJ0ng8sB0rpUIwHxsrGTp5rwjjDjaUTtS4
 CKqKs0VxJ4BuTai5WnsEk0Gnl+dv7O9KqJFHZ0vEcirv8=

Hi Umang,

Am 03.07.24 um 15:10 schrieb Umang Jain:
> wait_event_interruptible() returns if the condition evaluates to true
> it receives a signal. However, the current code always assume that the
> wait_event_interruptible() returns only when the event is fired.
> This should not be the case as wait_event_interruptible() can
> return on receiving a signal (with -ERESTARTSYS as return value).
>
> We should consider this and bubble up the return value of
> wait_event_interruptible() to exactly know if the wait has failed
> and error out. This will also help to properly stop kthreads in the
> subsequent patch.
>
> Meanwhile at it, remote_wait_event() is modified to return 0 on success,
> and an error code (from wait_event_interruptible()) on failure. The
> return value is now checked for remote_wait_event() calls.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../interface/vchiq_arm/vchiq_core.c          | 31 ++++++++++++++-----
>   1 file changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 4f65e4021c4d..dd70f2881eca 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -501,16 +501,21 @@ remote_event_create(wait_queue_head_t *wq, struct =
remote_event *event)
>    * routines where switched to the "interruptible" family of functions,=
 as the
>    * former was deemed unjustified and the use "killable" set all VCHIQ'=
s
>    * threads in D state.
> + *
> + * Returns: 0 on success, a negative error code on failure
>    */
>   static inline int
>   remote_event_wait(wait_queue_head_t *wq, struct remote_event *event)
>   {
> +	int ret =3D 0;
> +
>   	if (!event->fired) {
>   		event->armed =3D 1;
>   		dsb(sy);
> -		if (wait_event_interruptible(*wq, event->fired)) {
> +		ret =3D wait_event_interruptible(*wq, event->fired);
> +		if (ret) {
>   			event->armed =3D 0;
> -			return 0;
> +			return ret;
>   		}
>   		event->armed =3D 0;
>   		/* Ensure that the peer sees that we are not waiting (armed =3D=3D 0=
). */
> @@ -518,7 +523,7 @@ remote_event_wait(wait_queue_head_t *wq, struct remo=
te_event *event)
>   	}
>
>   	event->fired =3D 0;
> -	return 1;
> +	return ret;
in general this patch looks good to me. But maybe we better return 0
directly and reduce the scope of ret.
>   }
>
>   /*
> @@ -1140,6 +1145,7 @@ queue_message_sync(struct vchiq_state *state, stru=
ct vchiq_service *service,
>   	struct vchiq_header *header;
>   	ssize_t callback_result;
>   	int svc_fourcc;
> +	int ret;
>
>   	local =3D state->local;
>
> @@ -1147,7 +1153,9 @@ queue_message_sync(struct vchiq_state *state, stru=
ct vchiq_service *service,
>   	    mutex_lock_killable(&state->sync_mutex))
>   		return -EAGAIN;
>
> -	remote_event_wait(&state->sync_release_event, &local->sync_release);
> +	ret =3D remote_event_wait(&state->sync_release_event, &local->sync_rel=
ease);
> +	if (ret)
> +		return ret;
>
>   	/* Ensure that reads don't overtake the remote_event_wait. */
>   	rmb();
> @@ -1929,13 +1937,16 @@ slot_handler_func(void *v)
>   {
>   	struct vchiq_state *state =3D v;
>   	struct vchiq_shared_state *local =3D state->local;
> +	int ret;
>
>   	DEBUG_INITIALISE(local);
>
>   	while (1) {
>   		DEBUG_COUNT(SLOT_HANDLER_COUNT);
>   		DEBUG_TRACE(SLOT_HANDLER_LINE);
> -		remote_event_wait(&state->trigger_event, &local->trigger);
> +		ret =3D remote_event_wait(&state->trigger_event, &local->trigger);
> +		if (ret)
> +			return ret;
>
>   		/* Ensure that reads don't overtake the remote_event_wait. */
>   		rmb();
> @@ -1966,6 +1977,7 @@ recycle_func(void *v)
>   	struct vchiq_shared_state *local =3D state->local;
>   	u32 *found;
>   	size_t length;
> +	int ret;
>
>   	length =3D sizeof(*found) * BITSET_SIZE(VCHIQ_MAX_SERVICES);
>
> @@ -1975,7 +1987,9 @@ recycle_func(void *v)
>   		return -ENOMEM;
>
>   	while (1) {
> -		remote_event_wait(&state->recycle_event, &local->recycle);
> +		ret =3D remote_event_wait(&state->recycle_event, &local->recycle);
> +		if (ret)
> +			return ret;
>
>   		process_free_queue(state, found, length);
>   	}
> @@ -1992,6 +2006,7 @@ sync_func(void *v)
>   		(struct vchiq_header *)SLOT_DATA_FROM_INDEX(state,
>   			state->remote->slot_sync);
>   	int svc_fourcc;
> +	int ret;
>
>   	while (1) {
>   		struct vchiq_service *service;
> @@ -1999,7 +2014,9 @@ sync_func(void *v)
>   		int type;
>   		unsigned int localport, remoteport;
>
> -		remote_event_wait(&state->sync_trigger_event, &local->sync_trigger);
> +		ret =3D remote_event_wait(&state->sync_trigger_event, &local->sync_tr=
igger);
> +		if (ret)
> +			return ret;
>
>   		/* Ensure that reads don't overtake the remote_event_wait. */
>   		rmb();

