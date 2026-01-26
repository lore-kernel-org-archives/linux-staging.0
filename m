Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561FB32E69F
	for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769425877; cv=none; b=vETq2sf6e7o0y+aJavXpggLHmwzMo3r7Z67E85KVoDM28OixCYO0nGI9AAhWrOdJ4lKE9p9v0WyM4fQ7xZCs7Xn2cDD4k6p/DbveUmhj/Zx/UtEPQKoKx9BhDRhRhLgx6toN4ArimSy3luumr5pBtZ2DuBaGnCgCC5U6VxWQF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769425877; c=relaxed/simple;
	bh=6FB0arrczo1kAehTkyA/0p8mh0g59QVZvIExUPdL92c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=el+AyDH8bT7+rQlfWkhBTCixB+rvys7lwJSO2jCe2mPvaGdelZ9X4oJZT97pVZjfgSXtRpZTtkwq91LkXyJI8+Qyhydn1MbGs8evtPfRVlX9Zl88koACNdfkIRtzSg648rro2wMmViGey1LxA2DfifjQCLtv/oRb+oeebkkEfYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBU1K2CB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBU1K2CB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso46198205e9.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 03:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769425874; x=1770030674; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IMfQPmWBkGs6B3W9EZ66X9JXLz5zHb4VAsfmHmE9rV8=;
        b=ZBU1K2CBz6vgIAuQgA707/v69EivX5ngtGtJurjpbFIhs6Hb8PG+kiclYrMWCywaoM
         5w9kRgx85nli6abMOp0/8daRvxFGn/X5PjMkEbigfypAYNddphubdgDOgJF5XtpVw8Xs
         +KqGEBaA1ZSDLl1Yy88LtE095qZmdpFnOAZMVOzR909nZm0zKvVR3itimFxGdx5mUmnZ
         FoQIh1kFDs/DGE/yA63PQ5xcnkuyhnow2TAVkLtvvURJQpUl6o9Fe7svAkIlv2y733iP
         DEmMp18Udxdvd9vgDYvupV+f9CC5dafYnD+4qEqGEUxvinfhAM7JFKB9EqkymGLK56h1
         EkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425874; x=1770030674;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMfQPmWBkGs6B3W9EZ66X9JXLz5zHb4VAsfmHmE9rV8=;
        b=TG3Ja5q0Tkk6OY12mS20OsS5FtojlKfKB59+Okk75bDnPk3Deb+mdVsYBFl+C2U0LX
         pBJdVfECsW+PVcIjr5zrFFComehkPvCRNmTQCOirKzUdjm6/cPUglMtD4kEviRDsFjmm
         CthYFD4Wysmu/YzeEWBMb9H1AmNP+Rj5XZwDhAaag4ckZT/PAhyE3h8K07737wdQbA7/
         zoNLnkIvwfJ0YOkOxE+bwIFLo39fWgpydRg5sTFt/eDgUmt1geE0s2AfBuyC1CZCAazX
         zWciXrmwxF4jHqH2dhmtpyONJk3zrrdbVISleK1RoNTIkvZ73fPFNHWJGVyMptvZPdtC
         SCBw==
X-Forwarded-Encrypted: i=1; AJvYcCUOu73fgAdoZ2EV3zteNNnKhVS24NKTEfMA1Nyzgrpo7JEZLaDsvDcHsGD1xp33a54QAhp0KMXB91ttqvnO@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7sBSruuzUWSqg3VmLM+SDB4joDRTuBF1M5s1LT+L6ImroNHPB
	ejfLXL3kAgTB+pl6qwUwybxN2+OXiPaSH2fEdlBnHFK9Sj4RY/FMiBPb
X-Gm-Gg: AZuq6aJ3Zc14MPTwGizJL2WxmiiTMZ3NivsoOijrCqh7YyQeRq/NiiWucWRKZKhHzIG
	nzP8llAVVqLR9P6fCeWLbDliCsDbcJ0ZBWxC4pihpn0NuiZ4lAjKI0ISVKduANMAUERHxXRI+k9
	yBS863Nf4mSNlaXqQx7Zb9ZuYF/lzUMrjX8hE9QSaeGHnYtYWSB71MJud6anYJeeMD4mQuOrltU
	b2f7wZV2Wd4sV/5g2PJum8qAERBg9el7D/mO2iJ26LBzqbpg1j1RlXAqhtk2pc2hqUHEwc/504W
	YypbWZC4BNK6dP5n8V5Cx37ulFzKwSsfBgKiEVmOcAKfyNPlOXbbyUPmu6PgoilYSspOeodstJN
	j5xjDxQvXUIrXOSbQG91Ds8idJ6rsdQCjkqc8hSM70Y24WGdxPislroMzQifGykJNZOiPJ471Ty
	CdH9znUZrzObusSH3AZLH7rkRmwy94
X-Received: by 2002:a05:600c:8706:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-4805ce3ffdemr71874835e9.6.1769425873482;
        Mon, 26 Jan 2026 03:11:13 -0800 (PST)
Received: from [192.168.0.100] ([188.27.128.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f742d6sm29305746f8f.30.2026.01.26.03.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 03:11:13 -0800 (PST)
Message-ID: <edd6a420-9958-43a2-a761-bed5ec547591@gmail.com>
Date: Mon, 26 Jan 2026 13:10:23 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH RESEND v8 17/21] media: i2c: maxim-serdes: add MAX9296A
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ceclan Dumitru <mitrutzceclan@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
 <20251208-gmsl2-3_serdes-v8-17-7b8d457e2e04@analog.com>
 <aW-EXiiKFLrXQeJG@kekkonen.localdomain>
 <47ce1e14-5443-4d3e-a2c9-7d5be47012c9@gmail.com>
 <20260126100153.GB593812@killaraus>
Content-Language: en-US
In-Reply-To: <20260126100153.GB593812@killaraus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent, Sakari. As this is code written by me I can provide some
clarifications.

On 1/26/26 12:01 PM, Laurent Pinchart wrote:
> On Mon, Jan 26, 2026 at 11:55:47AM +0200, Ceclan Dumitru wrote:
>>
>>
>> On 1/20/26 3:34 PM, Sakari Ailus wrote:
>>> Hi Dumitru,
>>>
>>> On Mon, Dec 08, 2025 at 04:13:09PM +0200, Dumitru Ceclan via B4 Relay wrote:
>>>> +	*ops = max9296a_common_ops;
>>>> +
>>>> +	ops->versions = priv->info->ops->versions;
>>>> +	ops->modes = priv->info->ops->modes;
>>>> +	ops->needs_single_link_version = priv->info->ops->needs_single_link_version;
>>>> +	ops->needs_unique_stream_id = priv->info->ops->needs_unique_stream_id;
>>>> +	ops->fix_tx_ids = priv->info->ops->fix_tx_ids;
>>>> +	ops->num_phys = priv->info->ops->num_phys;
>>>> +	ops->num_pipes = priv->info->ops->num_pipes;
>>>> +	ops->num_links = priv->info->ops->num_links;
>>>> +	ops->phys_configs = priv->info->ops->phys_configs;
>>>> +	ops->set_pipe_enable = priv->info->ops->set_pipe_enable;
>>>> +	ops->set_pipe_stream_id = priv->info->ops->set_pipe_stream_id;
>>>> +	ops->set_pipe_tunnel_phy = priv->info->ops->set_pipe_tunnel_phy;
>>>> +	ops->set_pipe_tunnel_enable = priv->info->ops->set_pipe_tunnel_enable;
>>>> +	ops->use_atr = priv->info->ops->use_atr;
>>>> +	ops->tpg_mode = priv->info->ops->tpg_mode;
>>>
>>> What's the reason for doing these assignments and a copy of the memory? Why
>>> not to just keep a pointer to the struct memory instead? I think there's
>>> another case of the same.

Copy of the memory is to assign the common parts of the ops, while the
assignments add the ops that need to be chip-specific on top.

>>>
>> Would this be alright:
>> #define MAX9296A_COMMON_OPS					\
>>
>> 	.num_remaps_per_pipe = 16,				\
>>
>> 	.tpg_entries = { ... },					\
>>
>> 	.init = max9296a_init,					\
>>
>> 	.set_enable = max9296a_set_enable,			\
>>
>>
>> static const struct max_des_ops max9296a_ops = {
>>
>> 	MAX9296A_COMMON_OPS,
>>
>> 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
>>
>> 		    BIT(MAX_SERDES_GMSL_2_6GBPS),
>> 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE),
>> 	/* ... */
>>
>> 	};
>>
>>
>>
>> static int max9296a_probe(struct i2c_client *client)
>>
>> {
>>
>> 	/* ... */
>>
>> 	priv->des.ops = priv->info->ops;
>>
>> 	/* ... */
>>
>> }
> 
> That's still a copy. Why is a copy needed, why can't you write
> 
>   	priv->des.ops = &priv->info->ops;
>

priv->des.ops is a pointer, so is priv->info->ops, in the current code,
so this would not be a copy of the ops, just a pointer assignment.

See the struct definitions below.

struct max_des {
	struct max_des_priv *priv;

	const struct max_des_ops *ops;
	...
};


struct max9296a_chip_info {
	const struct max_des_ops *ops;
	...
};


struct max9296a_priv {
	struct max_des des;
	const struct max9296a_chip_info *info;
	...
};

> or event replace priv->des.ops with priv->info->ops through the code ?

max9296a_chip_info is the chip-specific struct for this driver, it's
retrieved using device_get_match_data().

max9296a_priv is the private driver data.

max_des is the data available for both the core framework and the
drivers implementing it.

max_des_priv is the private data of the core framework, containing
implementation details that are not really related to the chip itself
but more about how to expose the chip capabilities to the user,
eg. V4L2.

Because of this, priv->info->ops cannot be used through out the code
as priv is private to the driver, and so is info, while ops are used
in the core framework.

> Is there anything in the ops structure that needs to be modified at
> runtime ?

No, there is not. I think it would be fine for a MAX9296A_COMMON_OPS
macro be added which contains all the common ops, and then place it
as the first member of each instance of struct max_des_ops.

I'm sending some code inline as a proof-of-concept, maybe it would be
clearer how the current code will have to be changed. A similar thing
would have to be done for the other chip drivers.

Thank you for your feedback.

diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/i2c/maxim-serdes/max9296a.c
index a67692b2f5ee0..e9d6322c302f0 100644
--- a/drivers/media/i2c/maxim-serdes/max9296a.c
+++ b/drivers/media/i2c/maxim-serdes/max9296a.c
@@ -1038,49 +1038,48 @@ static const struct max_serdes_tpg_entry max9296a_tpg_entries[] = {
 	MAX_TPG_ENTRY_1920X1080P60_RGB888,
 };
 
-static const struct max_des_ops max9296a_common_ops = {
-	.num_remaps_per_pipe = 16,
-	.tpg_entries = {
-		.num_entries = ARRAY_SIZE(max9296a_tpg_entries),
-		.entries = max9296a_tpg_entries,
-	},
-	.tpg_patterns = BIT(MAX_SERDES_TPG_PATTERN_CHECKERBOARD) |
-			BIT(MAX_SERDES_TPG_PATTERN_GRADIENT),
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-	.reg_read = max9296a_reg_read,
+#define MAX9296A_COMMON_OPS_DEBUG					\
+	.reg_read = max9296a_reg_read,					\
 	.reg_write = max9296a_reg_write,
+#else
+#define MAX9296A_COMMON_OPS_DEBUG
 #endif
-	.log_pipe_status = max9626a_log_pipe_status,
-	.log_phy_status = max9296a_log_phy_status,
-	.set_enable = max9296a_set_enable,
-	.init = max9296a_init,
-	.init_phy = max9296a_init_phy,
-	.set_phy_mode = max9296a_set_phy_mode,
-	.set_phy_enable = max9296a_set_phy_enable,
-	.set_pipe_remap = max9296a_set_pipe_remap,
-	.set_pipe_remaps_enable = max9296a_set_pipe_remaps_enable,
-	.set_pipe_mode = max9296a_set_pipe_mode,
-	.set_tpg = max9296a_set_tpg,
-	.select_links = max9296a_select_links,
-	.set_link_version = max9296a_set_link_version,
-};
+
+#define MAX9296A_COMMON_OPS					\
+	MAX9296A_COMMON_OPS_DEBUG				\
+	.num_remaps_per_pipe = 16,				\
+	.tpg_entries = { 					\
+		.num_entries = ARRAY_SIZE(max9296a_tpg_entries),\
+		.entries = max9296a_tpg_entries,		\
+	},							\
+	.tpg_patterns = BIT(MAX_SERDES_TPG_PATTERN_CHECKERBOARD) |\
+			BIT(MAX_SERDES_TPG_PATTERN_GRADIENT),	\
+	.log_pipe_status = max9626a_log_pipe_status,		\
+	.log_phy_status = max9296a_log_phy_status,		\
+	.set_enable = max9296a_set_enable,			\
+	.init = max9296a_init,					\
+	.init_phy = max9296a_init_phy,				\
+	.set_phy_mode = max9296a_set_phy_mode,			\
+	.set_phy_enable = max9296a_set_phy_enable,		\
+	.set_pipe_remap = max9296a_set_pipe_remap,		\
+	.set_pipe_remaps_enable = max9296a_set_pipe_remaps_enable,\
+	.set_pipe_mode = max9296a_set_pipe_mode,		\
+	.set_tpg = max9296a_set_tpg,				\
+	.select_links = max9296a_select_links,			\
+	.set_link_version = max9296a_set_link_version
 
 static int max9296a_probe(struct i2c_client *client)
 {
 	struct regmap_config i2c_regmap = max9296a_i2c_regmap;
 	struct device *dev = &client->dev;
 	struct max9296a_priv *priv;
-	struct max_des_ops *ops;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
-	if (!ops)
-		return -ENOMEM;
-
 	priv->info = device_get_match_data(dev);
 	if (!priv->info) {
 		dev_err(dev, "Failed to get match data\n");
@@ -1110,24 +1109,7 @@ static int max9296a_probe(struct i2c_client *client)
 		usleep_range(4000, 5000);
 	}
 
-	*ops = max9296a_common_ops;
-
-	ops->versions = priv->info->ops->versions;
-	ops->modes = priv->info->ops->modes;
-	ops->needs_single_link_version = priv->info->ops->needs_single_link_version;
-	ops->needs_unique_stream_id = priv->info->ops->needs_unique_stream_id;
-	ops->fix_tx_ids = priv->info->ops->fix_tx_ids;
-	ops->num_phys = priv->info->ops->num_phys;
-	ops->num_pipes = priv->info->ops->num_pipes;
-	ops->num_links = priv->info->ops->num_links;
-	ops->phys_configs = priv->info->ops->phys_configs;
-	ops->set_pipe_enable = priv->info->ops->set_pipe_enable;
-	ops->set_pipe_stream_id = priv->info->ops->set_pipe_stream_id;
-	ops->set_pipe_tunnel_phy = priv->info->ops->set_pipe_tunnel_phy;
-	ops->set_pipe_tunnel_enable = priv->info->ops->set_pipe_tunnel_enable;
-	ops->use_atr = priv->info->ops->use_atr;
-	ops->tpg_mode = priv->info->ops->tpg_mode;
-	priv->des.ops = ops;
+	priv->des.ops = priv->info->ops;
 
 	ret = max9296a_reset(priv);
 	if (ret)
@@ -1154,6 +1136,7 @@ static const struct max_serdes_phys_config max96714_phys_configs[] = {
 };
 
 static const struct max_des_ops max9296a_ops = {
+	MAX9296A_COMMON_OPS,
 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
 		    BIT(MAX_SERDES_GMSL_2_6GBPS),
 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE),
@@ -1181,6 +1164,7 @@ static const struct max9296a_chip_info max9296a_info = {
 };
 
 static const struct max_des_ops max96714_ops = {
+	MAX9296A_COMMON_OPS,
 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
 		    BIT(MAX_SERDES_GMSL_2_6GBPS),
 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
@@ -1226,6 +1210,7 @@ static const struct max9296a_chip_info max96714_info = {
 };
 
 static const struct max_des_ops max96714f_ops = {
+	MAX9296A_COMMON_OPS,
 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS),
 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
 		 BIT(MAX_SERDES_GMSL_TUNNEL_MODE),
@@ -1254,6 +1239,7 @@ static const struct max9296a_chip_info max96714f_info = {
 };
 
 static const struct max_des_ops max96716a_ops = {
+	MAX9296A_COMMON_OPS,
 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
 		    BIT(MAX_SERDES_GMSL_2_6GBPS),
 	.modes = BIT(MAX_SERDES_GMSL_PIXEL_MODE) |
@@ -1286,6 +1272,7 @@ static const struct max9296a_chip_info max96716a_info = {
 };
 
 static const struct max_des_ops max96792a_ops = {
+	MAX9296A_COMMON_OPS,
 	.versions = BIT(MAX_SERDES_GMSL_2_3GBPS) |
 		    BIT(MAX_SERDES_GMSL_2_6GBPS) |
 		    BIT(MAX_SERDES_GMSL_3_12GBPS),

