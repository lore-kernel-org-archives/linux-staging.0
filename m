Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EAD27EFEE
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 14:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671400; cv=none; b=RhZU73OkDxONQOJLf7bn+OM2jAKw9au/Q0V9eJHu7Wk7PGn+mqHV6ClW2S/OMtonoRRDHKceKxEDzg+eTF6IPori7FmiZIhLDSBiXQgpGGrdn1MANWcAUdhSO443Sr5h8VuCx6lNpOf+FosT1vXRHhjn/NPeIV2O91b4dKFM3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671400; c=relaxed/simple;
	bh=sy31XAcOSOP04WXYi1Niz+LRX09jox1GtLhP3p9Iuj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sM38PXpDbci37VZvLC2/8ahsZ3AhFoKgbCd93P/vYuy2TmEaDSmEq0XJV45NLG7lLZcIaLcEx6OLZXtPnHRURctdJWyXvsNru/iesyfcXWPwbUUPL7Bmn6efQUuqwZOVrhK/1mbOaJTok53HPobY10P5aVK0/r0ipLbN/HyI9OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f355SwuS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f355SwuS"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so4581802f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773671395; x=1774276195; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M5O1swU8NmOTLqK1D+m8GT/l2uaibTB/blQwNEMTUaU=;
        b=f355SwuSwIK/ozLM8W2FlU4SfAQZDmhizxKeXOCJJn/uM/v7jgaaWbL3bwc+1Chqma
         h+FJKG7gQoxrYlgrud13CBrC9eOL7RzBlmm5gTh4yWHDjZFUa21nWZ9+IScck7NAXGqm
         3dUBgdGPp+bt8Ni8t3Q4uxVbOz4RUsHNzS5qnMmeqDbbFcN+iSPcfFPdvMZpOZ1CLweH
         3zzMVaZegytuAoR850Qvh+bO6mDUoWvfV2p2rqiRSBbiLkma4j3wPRON/KtGbRwCNvAj
         5TCoy0HFXuoQ64PHICJSi43zpzHCvGCfvrbKNJu6VwUc3VsqZAPaYOHpulPbPXo5L9xE
         RArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671395; x=1774276195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5O1swU8NmOTLqK1D+m8GT/l2uaibTB/blQwNEMTUaU=;
        b=dwLNbmqlJR5I1l3U46SRUJxpfg3zlWgbn2XS0+1hvDY8FQXWYkfSfNiSWJJWi6kx7L
         Q4Rj/9Y1zcuoPYSLrIpv92Z/iFOe0Iz37c9w7UPLLEcRHiJlCjx+e4Ju44xsB052xkYZ
         ILeuyXDQlA0wz3busro1FDNRd+AANV1TTP74dVGTZV50cEQ1skfAbc/oIQSC2Etbuj7m
         LLPW/Yv1jJt6XrmR3HD9umn4rsK22oiw6CIKCB6ysL51cK/6FziN0yXyi4vRhlrJf446
         IF2wv0OuUeEdSWNBycNsRBGWh7kteV1EUxkJc/AW3s9dM7VIwY3qdYM+0zGx5TDHlHtc
         hGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvuCaa5KgX0BsxFPMvEI7h9rcklihMQjlmx/UDkj++8XZ+slrajFM5JbNx3GTEM0RIPgvpM5Q0Q/nzBVN0@lists.linux.dev
X-Gm-Message-State: AOJu0YyGnJeEnhyLYHZCUteftgUnmhZXjGRKy3wIzbiYVhTyNnhFALuq
	BleqFXBCVoFjg+7SRijGGxuNKeG5s0bcHj3z8/yPVg25buV/ZBDO5hKNw23Zlipp15k=
X-Gm-Gg: ATEYQzwUtq0aqm3mfu4UoLNjtRJbPBlP12VdT1q9Ym8UFDmD7TW8NBWdlIuwUD0d63D
	ioOVXPcEtKzTu5qg4+yXXYBAtQqWAwiOzOhF6pdZY5YMmTcLKhKIulBHUvBlioZO+/naZ5siJir
	+3/JWjXRWnJkWF7ifo6pCBYx39t9pOjFrEUoZxrGio0CyT2FtrXhU7X7srlsA9UMDnti2NqD5BJ
	o0vKyxNCNNPnEVaY0eKGKMWJE9RLt4wvZWHNLCg9AvZer8buXNvbXU30HGuyaTI1aeqZq8c3CcI
	a+vVQ04b+Ro/UPOSvBEOg5SdeFaUQnXQ1BTGtIlUOD4TzZfKffGqfeiTVipdgdvxy5lYsxWncfj
	B399wODNmZ8D07xZlr3Sn5QkWgJ9hhFqDax6Kelo860K/mkDzTiFATk3MEtSOZnrSZ4Wn+X5riy
	RdME/KakBGlefhExqYhQMYqXvis/tJB6WpGsEXPvA=
X-Received: by 2002:a05:600c:1d0f:b0:485:3f38:3de3 with SMTP id 5b1f17b1804b1-485566d2fc4mr219241785e9.3.1773671395245;
        Mon, 16 Mar 2026 07:29:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm897879915e9.10.2026.03.16.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:29:54 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:29:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/2 RESEND] greybus: raw: fix use-after-free if write is
 called after disconnect
Message-ID: <abgT3zPdHZatrA1S@stanley.mountain>
References: <20260311212511.82563-1-damien.riegel@silabs.com>
 <20260311212511.82563-2-damien.riegel@silabs.com>
 <abezGG0LODIA4SZS@stanley.mountain>
 <DH48H3G3GL8O.3DLF1KZQGXRUH@silabs.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DH48H3G3GL8O.3DLF1KZQGXRUH@silabs.com>

On Mon, Mar 16, 2026 at 09:16:31AM -0400, Damien Riégel wrote:
> On Mon Mar 16, 2026 at 3:36 AM EDT, Dan Carpenter wrote:
> > On Wed, Mar 11, 2026 at 05:25:11PM -0400, Damien Riégel wrote:
> >> If a user writes to the chardev after disconnect has been called, the
> >> kernel panics with the following trace (with
> >> CONFIG_INIT_ON_FREE_DEFAULT_ON=y):
> >>
> >>     [   83.828726] BUG: kernel NULL pointer dereference, address: 0000000000000218
> >>     [   83.829288] #PF: supervisor read access in kernel mode
> >>     [   83.829528] #PF: error_code(0x0000) - not-present page
> >>     [   83.829828] PGD 0 P4D 0
> >>     [   83.830126] Oops: Oops: 0000 [#1] SMP NOPTI
> >>     [   83.830753] CPU: 0 UID: 0 PID: 140 Comm: raw_chardev_tes Tainted: G         C          6.18.0-rc4 #212 PREEMPT(voluntary)
> >>     [   83.831260] Tainted: [C]=CRAP
> >>     [   83.831426] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
> >>     [   83.831912] RIP: 0010:gb_operation_message_alloc+0x14/0xc0
> >>     [   83.832366] Code: 00 00 00 00 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 56 4c 8d 72 08 41 55 41 89 cd1
> >>     [   83.832979] RSP: 0018:ffffb73f0027bd58 EFLAGS: 00010286
> >>     [   83.833247] RAX: ffffa44741f72300 RBX: ffffa44741f72300 RCX: 0000000000000cc0
> >>     [   83.833513] RDX: 000000000000000a RSI: 0000000000000002 RDI: 0000000000000000
> >>     [   83.833732] RBP: 0000000000000cc0 R08: 0000000000000000 R09: 0000000000000000
> >>     [   83.834044] R10: ffffa44741f72300 R11: 0000000000000000 R12: 0000000000000002
> >>     [   83.834267] R13: 0000000000000cc0 R14: 0000000000000012 R15: 0000000000000000
> >>     [   83.834533] FS:  00007fead7859740(0000) GS:ffffa447a31bc000(0000) knlGS:0000000000000000
> >>     [   83.834776] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>     [   83.834974] CR2: 0000000000000218 CR3: 000000000216b000 CR4: 00000000000006f0
> >>     [   83.835259] Call Trace:
> >>     [   83.835983]  <TASK>
> >>     [   83.836362]  gb_operation_create_common+0x61/0x180
> >>     [   83.836653]  gb_operation_create_flags+0x28/0xa0
> >>     [   83.836912]  gb_operation_sync_timeout+0x6f/0x100
> >>     [   83.837162]  raw_write+0x7b/0xc7 [gb_raw]
> >>     [   83.837460]  vfs_write+0xcf/0x420
> >>     [   83.837615]  ? task_mm_cid_work+0x136/0x220
> >>     [   83.837784]  ksys_write+0x63/0xe0
> >>     [   83.837946]  do_syscall_64+0xa4/0x290
> >>     [   83.838097]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >>     [   83.838359] RIP: 0033:0x7fead78e9cc7
> >>     [   83.838712] Code: 48 89 fa 4c 89 df e8 08 ae 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44f
> >>     [   83.839190] RSP: 002b:00007ffece5c3de0 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> >>     [   83.839489] RAX: ffffffffffffffda RBX: 00007fead7859740 RCX: 00007fead78e9cc7
> >>     [   83.839675] RDX: 0000000000000006 RSI: 0000563d13f96326 RDI: 0000000000000003
> >>     [   83.839892] RBP: 00007ffece5c3e38 R08: 0000000000000000 R09: 0000000000000000
> >>     [   83.840112] R10: 0000000000000000 R11: 0000000000000202 R12: 0000563cf8925128
> >>     [   83.840350] R13: 00007fead78596d0 R14: 0000563d13f96320 R15: 0000563d13f96326
> >>     [   83.840635]  </TASK>
> >>     [   83.840824] Modules linked in: gb_raw(C)
> >>     [   83.841311] CR2: 0000000000000218
> >>     [   83.842009] ---[ end trace 0000000000000000 ]---
> >>
> >> Disconnect calls gb_connection_destroy, which ends up freeing the
> >> connection object. When gb_operation_sync is called in the write file
> >> operations, its gets a freed connection as parameter and the kernel
> >> panics.
> >>
> >> The gb_connection_destroy cannot be moved out of the disconnect
> >> function, as the Greybus subsystem expect all connections belonging to a
> >> bundle to be destroyed when disconnect returns.
> >>
> >> To prevent this bug, use a lock to synchronize access between write and
> >> disconnect. This guarantees that in the write function raw->connection
> >> is either a valid object or a NULL pointer.
> >>
> >> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
> >> Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
> >> ---
> >> resend: added linux-staging as Cc, this list was not part of the first
> >> submission.
> >>
> >>  drivers/staging/greybus/raw.c | 26 ++++++++++++++++++++------
> >>  1 file changed, 20 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> >> index b92214f97e3..aa4086ff397 100644
> >> --- a/drivers/staging/greybus/raw.c
> >> +++ b/drivers/staging/greybus/raw.c
> >> @@ -21,6 +21,7 @@ struct gb_raw {
> >>       struct list_head list;
> >>       int list_data;
> >>       struct mutex list_lock;
> >> +     struct mutex write_lock;        /* Synchronize access to connection */
> >>       struct cdev cdev;
> >>       struct device dev;
> >>  };
> >> @@ -124,8 +125,8 @@ static int gb_raw_request_handler(struct gb_operation *op)
> >>
> >>  static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
> >>  {
> >> -     struct gb_connection *connection = raw->connection;
> >>       struct gb_raw_send_request *request;
> >> +     struct gb_connection *connection;
> >>       int retval;
> >>
> >>       request = kmalloc(len + sizeof(*request), GFP_KERNEL);
> >> @@ -139,9 +140,15 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
> >>
> >>       request->len = cpu_to_le32(len);
> >>
> >> -     retval = gb_operation_sync(connection, GB_RAW_TYPE_SEND,
> >> -                                request, len + sizeof(*request),
> >> -                                NULL, 0);
> >> +     mutex_lock(&raw->write_lock);
> >> +     retval = -ENODEV;
> >> +
> >> +     connection = raw->connection;
> >> +     if (connection)
> >> +             retval = gb_operation_sync(connection, GB_RAW_TYPE_SEND,
> >> +                                        request, len + sizeof(*request),
> >> +                                        NULL, 0);
> >> +     mutex_unlock(&raw->write_lock);
> >                      ^^^^^^^^^^^^^^^^
> >
> > I feel like we need to do a get_device() here as well otherwise the
> > put_device(&raw->dev) in gb_raw_disconnect() could delete the last
> > reference and free raw.  I have looked at this and I feel like what
> > I'm saying is reasonable but I don't necessarily know how the reference
> > couting works for cdev.  Please feel free to correct me.  :)
> 
> This is not my understanding, nor what I could see when I tested this.
> With cdev_device_add(cdev, dev), dev becomes the parent of the chardev.
> So as long as the cdev is opened, dev cannot go away because its child
> holds a reference to it (it's done for us by device core logic, we don't
> have to take care of that or manually get_device()).
> 
> If gb_raw_disconnect() is called while the device is opened, raw->dev
> won't be freed until the cdev is closed. When that happens, cdev's
> refcount drops to 0, which drops the reference to its parent, which can
> finally be freed.
> 
> So I think the part you highlighted is fine as is. If you're fine with
> it, I'll just send a new version of the patchset with the first patch
> fixed (error path mishandled in probe function).

Yeah.  Thanks for the explanation.

regards,
dan carpenter

