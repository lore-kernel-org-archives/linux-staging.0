Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA2101D4
	for <linux-staging@lists.linux.dev>; Mon, 20 Nov 2023 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ealm7jsP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40806e4106dso9000435e9.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Nov 2023 02:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700474459; x=1701079259; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jq9JRUdKOLTnT8WnnlX5Kjk7fKbCoaZLOG+eigQvj6U=;
        b=ealm7jsPDc7kukFa9kdcnYQMcR6q1RcWzZbAxzvIQWZ+HsSiXdds6/QKKQC/S/K9Zz
         B1kF4O4+heA7K7jm6Y7zn5NKoFUNeQw+Xvl0yY1f6wMYfX7yHXGxxlpYlTZyC3+/hK2J
         v4sTUJlVAqOEimKxn3yj4jzfPvnVqKGlYv0wsIqWRfE2bIcl+l+da+4jOaXbCQbKSjtm
         NaA14d62lzuROM8fGApeeBVkIn1/MDwBuPwCPQvzZNRc9EF1t374M7Fny8QuieaocgiE
         47T7AfCCyi6OIKr/I0Cc1En5tEyaoiRZWPgLZkK+MiugK91EDh3QUM9IS5zKIw1uWB6+
         W2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700474459; x=1701079259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq9JRUdKOLTnT8WnnlX5Kjk7fKbCoaZLOG+eigQvj6U=;
        b=GtM2dQwMHks1APv0JDs64XeYahIGXXzA8baKoDd+fRieABCwuAK3+uMfjdw1WiSpSa
         fWq7n3kdVY81jlHsZAGJ2tcKvagtYZWGBylS38d/ypQADIk9cwILtVJ0OiQldtuYr6Bb
         9MbkW17LNIuZHM2IzN9lkGP+2CWd50EEdvHfzhu+dAI0VOfVqOYIXrsIMUYlxBdYrl4m
         NqxaRnCTJSU4LRsFhJpsgusi8pyMabZrQcmVaUzcPh/oOdzlJ0eU0muvyiepGl2bJid0
         qp9fYCYqUXLKlpSH2wPrK/vQF2rgCHQDyVuJ+zARW8+NF4bhBSveKDiHrppZ+dUNC4Xv
         ch5w==
X-Gm-Message-State: AOJu0YzfRaNdJpvEuQhSi1rK6K8U6Xp2iV8W7TxnOHf2N/NZLwBSQXyP
	KndXAR09WiL3fpBbM3Tv1cDl/w==
X-Google-Smtp-Source: AGHT+IHgsSU9xj0hKPWpxT9Vk1ZeDlmDhlQtZDVSmlX098fSTuAZhRxTckOXWCNL1Om5eh3w7fsDHA==
X-Received: by 2002:a05:600c:348b:b0:405:2d29:1648 with SMTP id a11-20020a05600c348b00b004052d291648mr10756789wmq.19.1700474458629;
        Mon, 20 Nov 2023 02:00:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c214c00b004065daba6casm17018246wml.46.2023.11.20.02.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 02:00:58 -0800 (PST)
Date: Mon, 20 Nov 2023 05:00:55 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Dan Carpenter <error27@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH v2 04/15] staging: mmal-vchiq: Add support for event
 callbacks
Message-ID: <2a3cb5ad-4791-4d37-a6a1-785432d5dd46@suswa.mountain>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231109210309.638594-5-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109210309.638594-5-umang.jain@ideasonboard.com>

On Thu, Nov 09, 2023 at 04:02:56PM -0500, Umang Jain wrote:
> +static void event_to_host_cb(struct vchiq_mmal_instance *instance,
> +			     struct mmal_msg *msg, u32 msg_len)
> +{
> +	int comp_idx = msg->u.event_to_host.client_component;
> +	struct vchiq_mmal_component *component =
> +					&instance->component[comp_idx];
> +	struct vchiq_mmal_port *port = NULL;
> +	struct mmal_msg_context *msg_context;
> +	u32 port_num = msg->u.event_to_host.port_num;
> +
> +	if (msg->u.buffer_from_host.drvbuf.magic == MMAL_MAGIC) {
> +		pr_err("%s: MMAL_MSG_TYPE_BUFFER_TO_HOST with bad magic\n",
> +		       __func__);
> +		return;
> +	}
> +
> +	switch (msg->u.event_to_host.port_type) {
> +	case MMAL_PORT_TYPE_CONTROL:
> +		if (port_num) {
> +			pr_err("%s: port_num of %u >= number of ports 1",

This message is confusing.  Perhaps:

	pr_err("%s: invalid port_num %u (should be zero)", ...

> +			       __func__, port_num);
> +			return;
> +		}
> +		port = &component->control;
> +		break;
> +	case MMAL_PORT_TYPE_INPUT:
> +		if (port_num >= component->inputs) {
> +			pr_err("%s: port_num of %u >= number of ports %u",

	pr_err("%s: port_num (%u) >= component->inputs (%u)",


> +			       __func__, port_num,
> +			       port_num >= component->inputs);
> +			return;
> +		}
> +		port = &component->input[port_num];
> +		break;
> +	case MMAL_PORT_TYPE_OUTPUT:
> +		if (port_num >= component->outputs) {
> +			pr_err("%s: port_num of %u >= number of ports %u",


	pr_err("%s: port_num (%u) >= component->outputs (%u)",

> +			       __func__, port_num,
> +			       port_num >= component->outputs);
> +			return;
> +		}
> +		port = &component->output[port_num];
> +		break;
> +	case MMAL_PORT_TYPE_CLOCK:
> +		if (port_num >= component->clocks) {
> +			pr_err("%s: port_num of %u >= number of ports %u",
> +			       __func__, port_num,
> +			       port_num >= component->clocks);
> +			return;
> +		}
> +		port = &component->clock[port_num];
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!mutex_trylock(&port->event_context_mutex)) {
> +		pr_err("dropping event 0x%x\n", msg->u.event_to_host.cmd);
> +		return;
> +	}
> +	msg_context = port->event_context;
> +
> +	if (msg->h.status != MMAL_MSG_STATUS_SUCCESS) {
> +		/* message reception had an error */
> +		pr_err("%s: error %d in reply\n", __func__, msg->h.status);
> +
> +		msg_context->u.bulk.status = msg->h.status;
> +	} else if (msg->u.event_to_host.length > MMAL_WORKER_EVENT_SPACE) {
> +		/* data is not in message, queue a bulk receive */
> +		pr_err("%s: payload not in message - bulk receive??! NOT SUPPORTED\n",
> +		       __func__);
> +		msg_context->u.bulk.status = -1;
> +	} else {
> +		memcpy(msg_context->u.bulk.buffer->buffer,
> +		       msg->u.event_to_host.data,
> +		       msg->u.event_to_host.length);
> +
> +		msg_context->u.bulk.buffer_used =
> +		    msg->u.event_to_host.length;
> +
> +		msg_context->u.bulk.mmal_flags = 0;
> +		msg_context->u.bulk.dts = MMAL_TIME_UNKNOWN;
> +		msg_context->u.bulk.pts = MMAL_TIME_UNKNOWN;
> +		msg_context->u.bulk.cmd = msg->u.event_to_host.cmd;
> +
> +		pr_debug("event component:%u port type:%d num:%d cmd:0x%x length:%d\n",
> +			 msg->u.event_to_host.client_component,
> +			 msg->u.event_to_host.port_type,
> +			 msg->u.event_to_host.port_num,
> +			 msg->u.event_to_host.cmd, msg->u.event_to_host.length);
> +	}
> +
> +	schedule_work(&msg_context->u.bulk.work);
> +}
> +
>  /* deals with receipt of buffer to host message */
>  static void buffer_to_host_cb(struct vchiq_mmal_instance *instance,
>  			      struct mmal_msg *msg, u32 msg_len)
> @@ -1329,6 +1421,7 @@ static int port_disable(struct vchiq_mmal_instance *instance,
>  				mmalbuf->mmal_flags = 0;
>  				mmalbuf->dts = MMAL_TIME_UNKNOWN;
>  				mmalbuf->pts = MMAL_TIME_UNKNOWN;
> +				mmalbuf->cmd = 0;
>  				port->buffer_cb(instance,
>  						port, 0, mmalbuf);
>  			}
> @@ -1630,6 +1723,43 @@ int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
>  }
>  EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
>  
> +static void init_event_context(struct vchiq_mmal_instance *instance,
> +			       struct vchiq_mmal_port *port)
> +{
> +	struct mmal_msg_context *ctx = get_msg_context(instance);
> +
> +	mutex_init(&port->event_context_mutex);
> +
> +	port->event_context = ctx;
> +	ctx->u.bulk.instance = instance;
> +	ctx->u.bulk.port = port;
> +	ctx->u.bulk.buffer =
> +		kzalloc(sizeof(*ctx->u.bulk.buffer), GFP_KERNEL);

This is 79 chars.  Delete the line break.

> +	if (!ctx->u.bulk.buffer)
> +		goto release_msg_context;
> +	ctx->u.bulk.buffer->buffer = kzalloc(MMAL_WORKER_EVENT_SPACE,
> +					     GFP_KERNEL);

regards,
dan carpenter
