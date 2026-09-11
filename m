Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22D3ACF0A
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 05:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103497; cv=none; b=Nrb+B9+Fh33QPxVMicPwT0gKo5DoO/9hEFdc8Crv+lXpEmHntg0jQQglTo8Rz+iblK4ZtD2uCLXYocUs3ZMADOWk++a/YnfGBhf4/RXZSCDrxzuwA9Z+HR/8JdcDDYB/jwZ3gQ0YqsOeTGip7G6TEWMaDMbUu9hXXl2EwuMNGT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103497; c=relaxed/simple;
	bh=lcB9RBmhJL98OKp4Dn4VavBHjA4zYoNhFAhTGOHR2PA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NTlHSvDfb0Ew7DYIU1seGaqtGn8gw88wgyqUSDqiEWyjHe23zq5t0BLC0ToQANXYwJD7tjQ9Nt/hlsSHr+F2l/VXgVHzhUxlVMT2o+AXsK3Q3PO0XoeD19ZXAO5VgIVkCvsvjbzVkkv6YZy3ifKbX2aQNGK5di/tAUhWBITxRag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGKhslth; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGKhslth"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso485145a12.1
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 22:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103494; x=1789708294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTjGgcOKMIoIu7hu1Jjtl2hE+YK/2adJ3Z9AxZAZmHo=;
        b=mGKhslth8XyhzDYbhVbawzjrqn3irdh8LHWDudDxmHSq/PVfcj210/mfcLFxDX7jEO
         UHZJdUUEQ97vDWuSriqioORcfaf/La10dug5aAJJq9PnvXW5B4do5xthEl9weIwVvrNr
         yvuYKctB3jVutAbfSfjpezPeBgeDTZfxFJId6Ix/GfpPUsR7MiApAOfRCacxXZFC+N+f
         NzeJ85ggqs40RcTxQnkvmFTGBBHyRYbu9a+uy/5jvwLVpZtexYFRkC2BlG9QcdajR9Pu
         u9Wq7g9l8eEJ69U9+rjTJ+e7hFbtp+C61Szb49nQjjyka1Ysh5hSHNNyP4k7p+G9Q8BX
         JX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103494; x=1789708294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTjGgcOKMIoIu7hu1Jjtl2hE+YK/2adJ3Z9AxZAZmHo=;
        b=fcnQkHZFCjO2STUbEKZdKNPzkpGO3eQylOh9/I6SFWJb9EPJGDjNNmByJxN4GKm17U
         Yhmp9vCeAwH69tU37OUY9Z5p/aP2nqXKi7g4rxvfk/F8IIUfZqwthgFHQdBSs4mH8R9d
         v8A2eCjDn/Fnrnsit/uOJBDwEVQGJxywWlHSbufoOXXToAyThjTVg4e6W1HgxSDxPTHM
         I8ensY0x9VqSU+loxRzVSf10l5pRIQBrAzj2SoyU4Hm7MHfbLVcYKT8wSyn4OtUsRlih
         UfBeofPzuB8vqtzXZTBwyk06Ndye9EOkYs8g31vjUQb7oNesaGWGA51at70ShUXZZ62U
         JNtA==
X-Forwarded-Encrypted: i=1; AKwUvBzHW6vJrlcqr9RDjdaKZDh9DY+TFnuR1mZ0dC9p7XE8QqISAWsuySeM0cf0DD8wPUPAJfEbemEUgkC6LReg@lists.linux.dev
X-Gm-Message-State: AFuF++lQAsAtA9G9Kf87/zz2pzalUa9RXJAUKLQFAz7ZPa5fRYGIQezk
	8Vdly7Nk6lEJrnqR31ehEsyw0IW1Q8zrz8Aa9FE/8CW4suym4c+VGLxF
X-Gm-Gg: AYBFou063+n/SAvhNXdry+M+8DTj6G1tmBDtd5q4Hj/AX6Gfv82xz3/9p3m9LAkFNro
	0YKtZbaZtkCSv1kUp/wEDVX1ZK5ibd4P3aZ3XGOx2IAABJdbamrjuc1RCfqKiB0vglp32tNYzCQ
	pMIa6/GgLxYuxaD30Pg/t4ja2ALgMOxpPazv+3gXwabD55m4hDQbd4+MuDrQqBgwO8kEbsBVTev
	kfYyw8tsPrmU5zGUwLCX0ZDpO7dhUb+S63FMb9+iyuBsdXBxzRp4zCcRXgRC9WDQ1unrelh2CXF
	NbKdHtjjAqppD7BCSaGgp4FeBaJXogS7hwTq6/ijYk7mYNJEFHIzbUgVj2/wcHu7BqlvZWMbxYA
	R+ARM5pbKeT1maGPQhjPKloQ/JK5qWD/qlHw+LzJGN64FRPRdCDRujJ0WxxnZA8eSkzSE7Z1eCK
	GWs+jU+kl64yCz0Pe+BMJnGxmGYm+7Qf9gFY6YhfrML/2iUUjvuafPgEAxuerEz8yBEoGdow7lM
	4Tw8KajA5T1ZYTAWwyygaPLzs2GZFDUH0fbSIYZrA==
X-Received: by 2002:a05:6a20:7347:b0:3d3:adad:f171 with SMTP id adf61e73a8af0-3daed333c1amr3897628637.19.1789103494129;
        Thu, 10 Sep 2026 22:11:34 -0700 (PDT)
Received: from EliteBook ([125.117.16.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65b1a63sm560786a12.31.2026.09.10.22.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:11:33 -0700 (PDT)
From: YiCheng Lu <01luyicheng@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	YiCheng Lu <01luyicheng@gmail.com>
Subject: [PATCH] staging: greybus: audio_codec.c: remove unnecessary parentheses
Date: Fri, 11 Sep 2026 13:11:19 +0800
Message-ID: <20260911051119.320619-1-01luyicheng@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around simple boolean expressions in
the if condition. The kernel coding style prefers not to use
parentheses around simple conditions.

Signed-off-by: YiCheng Lu <01luyicheng@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 1100 +++++++++++++++++++++++++
 1 file changed, 1100 insertions(+)
 create mode 100644 drivers/staging/greybus/audio_codec.c

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
new file mode 100644
index 0000000..44aee82
--- /dev/null
+++ b/drivers/staging/greybus/audio_codec.c
@@ -0,0 +1,1100 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * APBridge ALSA SoC dummy codec driver
+ * Copyright 2016 Google Inc.
+ * Copyright 2016 Linaro Ltd.
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <sound/soc.h>
+#include <sound/pcm_params.h>
+#include <uapi/linux/input.h>
+
+#include "audio_codec.h"
+#include "audio_apbridgea.h"
+#include "audio_manager.h"
+#include "audio_helper.h"
+
+static struct gbaudio_codec_info *gbcodec;
+
+static struct gbaudio_data_connection *
+find_data(struct gbaudio_module_info *module, int id)
+{
+	struct gbaudio_data_connection *data;
+
+	list_for_each_entry(data, &module->data_list, list) {
+		if (id == data->id)
+			return data;
+	}
+	return NULL;
+}
+
+static struct gbaudio_stream_params *
+find_dai_stream_params(struct gbaudio_codec_info *codec, int id, int stream)
+{
+	struct gbaudio_codec_dai *dai;
+
+	list_for_each_entry(dai, &codec->dai_list, list) {
+		if (dai->id == id)
+			return &dai->params[stream];
+	}
+	return NULL;
+}
+
+static int gbaudio_module_enable_tx(struct gbaudio_codec_info *codec,
+				    struct gbaudio_module_info *module, int id)
+{
+	int module_state, ret = 0;
+	u16 data_cport, i2s_port, cportid;
+	u8 sig_bits, channels;
+	u32 format, rate;
+	struct gbaudio_data_connection *data;
+	struct gbaudio_stream_params *params;
+
+	/* find the dai */
+	data = find_data(module, id);
+	if (!data) {
+		dev_err(module->dev, "%d:DATA connection missing\n", id);
+		return -ENODEV;
+	}
+	module_state = data->state[SNDRV_PCM_STREAM_PLAYBACK];
+
+	params = find_dai_stream_params(codec, id, SNDRV_PCM_STREAM_PLAYBACK);
+	if (!params) {
+		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
+		return -EINVAL;
+	}
+
+	/* register cport */
+	if (module_state < GBAUDIO_CODEC_STARTUP) {
+		i2s_port = 0;	/* fixed for now */
+		cportid = data->connection->hd_cport_id;
+		ret = gb_audio_apbridgea_register_cport(data->connection,
+							i2s_port, cportid,
+							AUDIO_APBRIDGEA_DIRECTION_TX);
+		if (ret) {
+			dev_err_ratelimited(module->dev, "reg_cport failed:%d\n", ret);
+			return ret;
+		}
+		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_STARTUP;
+		dev_dbg(module->dev, "Dynamic Register %d DAI\n", cportid);
+	}
+
+	/* hw_params */
+	if (module_state < GBAUDIO_CODEC_HWPARAMS) {
+		format = params->format;
+		channels = params->channels;
+		rate = params->rate;
+		sig_bits = params->sig_bits;
+		data_cport = data->connection->intf_cport_id;
+		ret = gb_audio_gb_set_pcm(module->mgmt_connection, data_cport,
+					  format, rate, channels, sig_bits);
+		if (ret) {
+			dev_err_ratelimited(module->dev, "set_pcm failed:%d\n", ret);
+			return ret;
+		}
+		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_HWPARAMS;
+		dev_dbg(module->dev, "Dynamic hw_params %d DAI\n", data_cport);
+	}
+
+	/* prepare */
+	if (module_state < GBAUDIO_CODEC_PREPARE) {
+		data_cport = data->connection->intf_cport_id;
+		ret = gb_audio_gb_set_tx_data_size(module->mgmt_connection,
+						   data_cport, 192);
+		if (ret) {
+			dev_err_ratelimited(module->dev,
+					    "set_tx_data_size failed:%d\n",
+					    ret);
+			return ret;
+		}
+		ret = gb_audio_gb_activate_tx(module->mgmt_connection, data_cport);
+		if (ret) {
+			dev_err_ratelimited(module->dev,
+					    "activate_tx failed:%d\n", ret);
+			return ret;
+		}
+		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_PREPARE;
+		dev_dbg(module->dev, "Dynamic prepare %d DAI\n", data_cport);
+	}
+
+	return 0;
+}
+
+static int gbaudio_module_disable_tx(struct gbaudio_module_info *module, int id)
+{
+	int ret;
+	u16 data_cport, cportid, i2s_port;
+	int module_state;
+	struct gbaudio_data_connection *data;
+
+	/* find the dai */
+	data = find_data(module, id);
+	if (!data) {
+		dev_err(module->dev, "%d:DATA connection missing\n", id);
+		return -ENODEV;
+	}
+	module_state = data->state[SNDRV_PCM_STREAM_PLAYBACK];
+
+	if (module_state > GBAUDIO_CODEC_HWPARAMS) {
+		data_cport = data->connection->intf_cport_id;
+		ret = gb_audio_gb_deactivate_tx(module->mgmt_connection,
+						data_cport);
+		if (ret) {
+			dev_err_ratelimited(module->dev,
+					    "deactivate_tx failed:%d\n", ret);
+			return ret;
+		}
+		dev_dbg(module->dev, "Dynamic deactivate %d DAI\n", data_cport);
+		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_HWPARAMS;
+	}
+
+	if (module_state > GBAUDIO_CODEC_SHUTDOWN) {
+		i2s_port = 0;	/* fixed for now */
+		cportid = data->connection->hd_cport_id;
+		ret = gb_audio_apbridgea_unregister_cport(data->connection,
+							  i2s_port, cportid,
+							  AUDIO_APBRIDGEA_DIRECTION_TX);
+		if (ret) {
+			dev_err_ratelimited(module->dev,
+					    "unregister_cport failed:%d\n", ret);
+			return ret;
+		}
+		dev_dbg(module->dev, "Dynamic Unregister %d DAI\n", cportid);
+		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_SHUTDOWN;
+	}
+
+	return 0;
+}
+
+static int gbaudio_module_enable_rx(struct gbaudio_codec_info *codec,
+				    struct gbaudio_module_info *module, int id)
+{
+	int module_state, ret = 0;
+	u16 data_cport, i2s_port, cportid;
+	u8 sig_bits, channels;
+	u32 format, rate;
+	struct gbaudio_data_connection *data;
+	struct gbaudio_stream_params *params;
+
+	/* find the dai */
+	data = find_data(module, id);
+	if (!data) {
+		dev_err(module->dev, "%d:DATA connection missing\n", id);
+		return -ENODEV;
+	}
+	module_state = data->state[SNDRV_PCM_STREAM_CAPTURE];
+
+	params = find_dai_stream_params(codec, id, SNDRV_PCM_STREAM_CAPTURE);
+	if (!params) {
+		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
+		return -EINVAL;
+	}
+
+	/* register cport */
+	if (module_state < GBAUDIO_CODEC_STARTUP) {
+		i2s_port = 0;	/* fixed for now */
+		cportid = data->connection->hd_cport_id;
+		ret = gb_audio_apbridgea_register_cport(data->connection,
+							i2s_port, cportid,
+							AUDIO_APBRIDGEA_DIRECTION_RX);
+		if (ret) {
+			dev_err_ratelimited(module->dev, "reg_cport failed:%d\n", ret);
+			return ret;
+		}
+		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_STARTUP;
+		dev_dbg(module->dev, "Dynamic Register %d DAI\n", cportid);
+	}
+
+	/* hw_params */
+	if (module_state < GBAUDIO_CODEC_HWPARAMS) {
+		format = params->format;
+		channels = params->channels;
+		rate = params->rate;
+		sig_bits = params->sig_bits;
+		data_cport = data->connection->intf_cport_id;
+		ret = gb_audio_gb_set_pcm(module->mgmt_connection, data_cport,
+					  format, rate, channels, sig_bits);
+		if (ret) {
+			dev_err_ratelimited(module->dev, "set_pcm failed:%d\n", ret);
+			return ret;
+		}
+		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_HWPARAMS;
+		dev_dbg(module->dev, "Dynamic hw_params %d DAI\n", data_cport);
+	}
+
+	/* prepare */
+	if (module_state < GBAUDIO_CODEC_PREPARE) {
+		data_cport = data->connection->intf_cport_id;
+		ret = gb_audio_gb_set_rx_data_size(module->mgmt_connection,
+						   data_cport, 192);
+		if (ret) {
+			dev_err_ratelimited(module->dev,
+					    "set_rx_data_size failed:%d\n",
+					    ret);
+			return ret;
+		}
+		ret = gb_audio_gb_activate_rx(module->mgmt_connection,
+					      data_cport);
+		if (ret) {
+			dev_err_ratelimited(module->dev,
+					    "activate_rx failed:%d\n", ret);
+			return ret;
+		}
+		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_PREPARE;
+		dev_dbg(module->dev, "Dynamic prepare %d DAI\n", data_cport);
+	}
+
+	return 0;
+}
+
+static int gbaudio_module_disable_rx(struct gbaudio_module_info *module, int id)
+{
+	int ret;
+	u16 data_cport, cportid, i2s_port;
+	int module_state;
+	struct gbaudio_data_connection *data;
+
+	/* find the dai */
+	data = find_data(module, id);
+	if (!data) {
+		dev_err(module->dev, "%d:DATA connection missing\n", id);
+		return -ENODEV;
+	}
+	module_state = data->state[SNDRV_PCM_STREAM_CAPTURE];
+
+	if (module_state > GBAUDIO_CODEC_HWPARAMS) {
+		data_cport = data->connection->intf_cport_id;
+		ret = gb_audio_gb_deactivate_rx(module->mgmt_connection,
+						data_cport);
+		if (ret) {
+			dev_err_ratelimited(module->dev,
+					    "deactivate_rx failed:%d\n", ret);
+			return ret;
+		}
+		dev_dbg(module->dev, "Dynamic deactivate %d DAI\n", data_cport);
+		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_HWPARAMS;
+	}
+
+	if (module_state > GBAUDIO_CODEC_SHUTDOWN) {
+		i2s_port = 0;	/* fixed for now */
+		cportid = data->connection->hd_cport_id;
+		ret = gb_audio_apbridgea_unregister_cport(data->connection,
+							  i2s_port, cportid,
+							  AUDIO_APBRIDGEA_DIRECTION_RX);
+		if (ret) {
+			dev_err_ratelimited(module->dev,
+					    "unregister_cport failed:%d\n", ret);
+			return ret;
+		}
+		dev_dbg(module->dev, "Dynamic Unregister %d DAI\n", cportid);
+		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_SHUTDOWN;
+	}
+
+	return 0;
+}
+
+int gbaudio_module_update(struct gbaudio_codec_info *codec,
+			  struct snd_soc_dapm_widget *w,
+			  struct gbaudio_module_info *module, int enable)
+{
+	int dai_id, ret;
+	char intf_name[NAME_SIZE], dir[NAME_SIZE];
+
+	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
+		enable ? "Enable" : "Disable");
+
+	if (w->id != snd_soc_dapm_aif_in && w->id != snd_soc_dapm_aif_out) {
+		dev_dbg(codec->dev, "No action required for %s\n", w->name);
+		return 0;
+	}
+
+	/* parse dai_id from AIF widget's stream_name */
+	ret = sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
+	if (ret < 3) {
+		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
+		return -EINVAL;
+	}
+
+	mutex_lock(&codec->lock);
+	if (w->id == snd_soc_dapm_aif_in) {
+		if (enable)
+			ret = gbaudio_module_enable_tx(codec, module, dai_id);
+		else
+			ret = gbaudio_module_disable_tx(module, dai_id);
+	} else if (w->id == snd_soc_dapm_aif_out) {
+		if (enable)
+			ret = gbaudio_module_enable_rx(codec, module, dai_id);
+		else
+			ret = gbaudio_module_disable_rx(module, dai_id);
+	}
+
+	mutex_unlock(&codec->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(gbaudio_module_update);
+
+/*
+ * codec DAI ops
+ */
+static int gbcodec_startup(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
+	struct gbaudio_stream_params *params;
+
+	mutex_lock(&codec->lock);
+
+	if (list_empty(&codec->module_list)) {
+		dev_err(codec->dev, "No codec module available\n");
+		mutex_unlock(&codec->lock);
+		return -ENODEV;
+	}
+
+	params = find_dai_stream_params(codec, dai->id, substream->stream);
+	if (!params) {
+		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
+		mutex_unlock(&codec->lock);
+		return -EINVAL;
+	}
+	params->state = GBAUDIO_CODEC_STARTUP;
+	mutex_unlock(&codec->lock);
+	/* to prevent suspend in case of active audio */
+	pm_stay_awake(dai->dev);
+
+	return 0;
+}
+
+static void gbcodec_shutdown(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
+	struct gbaudio_stream_params *params;
+
+	mutex_lock(&codec->lock);
+
+	if (list_empty(&codec->module_list))
+		dev_info(codec->dev, "No codec module available during shutdown\n");
+
+	params = find_dai_stream_params(codec, dai->id, substream->stream);
+	if (!params) {
+		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
+		mutex_unlock(&codec->lock);
+		return;
+	}
+	params->state = GBAUDIO_CODEC_SHUTDOWN;
+	mutex_unlock(&codec->lock);
+	pm_relax(dai->dev);
+}
+
+static int gbcodec_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *hwparams,
+			     struct snd_soc_dai *dai)
+{
+	int ret;
+	u8 sig_bits, channels;
+	u32 format, rate;
+	struct gbaudio_module_info *module;
+	struct gbaudio_data_connection *data;
+	struct gb_bundle *bundle;
+	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
+	struct gbaudio_stream_params *params;
+
+	mutex_lock(&codec->lock);
+
+	if (list_empty(&codec->module_list)) {
+		dev_err(codec->dev, "No codec module available\n");
+		mutex_unlock(&codec->lock);
+		return -ENODEV;
+	}
+
+	/*
+	 * assuming, currently only 48000 Hz, 16BIT_LE, stereo
+	 * is supported, validate params before configuring codec
+	 */
+	if (params_channels(hwparams) != 2) {
+		dev_err(dai->dev, "Invalid channel count:%d\n",
+			params_channels(hwparams));
+		mutex_unlock(&codec->lock);
+		return -EINVAL;
+	}
+	channels = params_channels(hwparams);
+
+	if (params_rate(hwparams) != 48000) {
+		dev_err(dai->dev, "Invalid sampling rate:%d\n",
+			params_rate(hwparams));
+		mutex_unlock(&codec->lock);
+		return -EINVAL;
+	}
+	rate = GB_AUDIO_PCM_RATE_48000;
+
+	if (params_format(hwparams) != SNDRV_PCM_FORMAT_S16_LE) {
+		dev_err(dai->dev, "Invalid format:%d\n", params_format(hwparams));
+		mutex_unlock(&codec->lock);
+		return -EINVAL;
+	}
+	format = GB_AUDIO_PCM_FMT_S16_LE;
+
+	/* find the data connection */
+	list_for_each_entry(module, &codec->module_list, list) {
+		data = find_data(module, dai->id);
+		if (data)
+			break;
+	}
+
+	if (!data) {
+		dev_err(dai->dev, "DATA connection missing\n");
+		mutex_unlock(&codec->lock);
+		return -EINVAL;
+	}
+
+	params = find_dai_stream_params(codec, dai->id, substream->stream);
+	if (!params) {
+		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
+		mutex_unlock(&codec->lock);
+		return -EINVAL;
+	}
+
+	bundle = to_gb_bundle(module->dev);
+	ret = gb_pm_runtime_get_sync(bundle);
+	if (ret) {
+		mutex_unlock(&codec->lock);
+		return ret;
+	}
+
+	ret = gb_audio_apbridgea_set_config(data->connection, 0,
+					    AUDIO_APBRIDGEA_PCM_FMT_16,
+					    AUDIO_APBRIDGEA_PCM_RATE_48000,
+					    6144000);
+	if (ret) {
+		dev_err_ratelimited(dai->dev, "%d: Error during set_config\n",
+				    ret);
+		gb_pm_runtime_put_noidle(bundle);
+		mutex_unlock(&codec->lock);
+		return ret;
+	}
+
+	gb_pm_runtime_put_noidle(bundle);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		sig_bits = dai->driver->playback.sig_bits;
+	else
+		sig_bits = dai->driver->capture.sig_bits;
+
+	params->state = GBAUDIO_CODEC_HWPARAMS;
+	params->format = format;
+	params->rate = rate;
+	params->channels = channels;
+	params->sig_bits = sig_bits;
+
+	mutex_unlock(&codec->lock);
+	return 0;
+}
+
+static int gbcodec_prepare(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	int ret;
+	struct gbaudio_module_info *module = NULL, *iter;
+	struct gbaudio_data_connection *data;
+	struct gb_bundle *bundle;
+	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
+	struct gbaudio_stream_params *params;
+
+	mutex_lock(&codec->lock);
+
+	if (list_empty(&codec->module_list)) {
+		dev_err(codec->dev, "No codec module available\n");
+		mutex_unlock(&codec->lock);
+		return -ENODEV;
+	}
+
+	list_for_each_entry(iter, &codec->module_list, list) {
+		/* find the dai */
+		data = find_data(iter, dai->id);
+		if (data) {
+			module = iter;
+			break;
+		}
+	}
+	if (!data) {
+		dev_err(dai->dev, "DATA connection missing\n");
+		mutex_unlock(&codec->lock);
+		return -ENODEV;
+	}
+
+	params = find_dai_stream_params(codec, dai->id, substream->stream);
+	if (!params) {
+		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
+		mutex_unlock(&codec->lock);
+		return -EINVAL;
+	}
+
+	bundle = to_gb_bundle(module->dev);
+	ret = gb_pm_runtime_get_sync(bundle);
+	if (ret) {
+		mutex_unlock(&codec->lock);
+		return ret;
+	}
+
+	switch (substream->stream) {
+	case SNDRV_PCM_STREAM_PLAYBACK:
+		ret = gb_audio_apbridgea_set_tx_data_size(data->connection, 0, 192);
+		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		ret = gb_audio_apbridgea_set_rx_data_size(data->connection, 0, 192);
+		break;
+	}
+	if (ret) {
+		gb_pm_runtime_put_noidle(bundle);
+		mutex_unlock(&codec->lock);
+		dev_err_ratelimited(dai->dev, "set_data_size failed:%d\n", ret);
+		return ret;
+	}
+
+	gb_pm_runtime_put_noidle(bundle);
+
+	params->state = GBAUDIO_CODEC_PREPARE;
+	mutex_unlock(&codec->lock);
+	return 0;
+}
+
+static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	int ret;
+	struct gbaudio_data_connection *data;
+	struct gbaudio_module_info *module = NULL, *iter;
+	struct gb_bundle *bundle;
+	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
+	struct gbaudio_stream_params *params;
+
+	dev_dbg(dai->dev, "Mute:%d, Direction:%s\n", mute,
+		stream ? "CAPTURE" : "PLAYBACK");
+
+	mutex_lock(&codec->lock);
+
+	params = find_dai_stream_params(codec, dai->id, stream);
+	if (!params) {
+		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
+		mutex_unlock(&codec->lock);
+		return -EINVAL;
+	}
+
+	if (list_empty(&codec->module_list)) {
+		dev_err(codec->dev, "No codec module available\n");
+		if (mute) {
+			params->state = GBAUDIO_CODEC_STOP;
+			ret = 0;
+		} else {
+			ret = -ENODEV;
+		}
+		mutex_unlock(&codec->lock);
+		return ret;
+	}
+
+	list_for_each_entry(iter, &codec->module_list, list) {
+		/* find the dai */
+		data = find_data(iter, dai->id);
+		if (data) {
+			module = iter;
+			break;
+		}
+	}
+	if (!data) {
+		dev_err(dai->dev, "%s DATA connection missing\n",
+			dai->name);
+		mutex_unlock(&codec->lock);
+		return -ENODEV;
+	}
+
+	bundle = to_gb_bundle(module->dev);
+	ret = gb_pm_runtime_get_sync(bundle);
+	if (ret) {
+		mutex_unlock(&codec->lock);
+		return ret;
+	}
+
+	if (!mute && !stream) {/* start playback */
+		ret = gb_audio_apbridgea_prepare_tx(data->connection, 0);
+		if (!ret)
+			ret = gb_audio_apbridgea_start_tx(data->connection, 0, 0);
+		params->state = GBAUDIO_CODEC_START;
+	} else if (!mute && stream) {/* start capture */
+		ret = gb_audio_apbridgea_prepare_rx(data->connection, 0);
+		if (!ret)
+			ret = gb_audio_apbridgea_start_rx(data->connection, 0);
+		params->state = GBAUDIO_CODEC_START;
+	} else if (mute && !stream) {/* stop playback */
+		ret = gb_audio_apbridgea_stop_tx(data->connection, 0);
+		if (!ret)
+			ret = gb_audio_apbridgea_shutdown_tx(data->connection, 0);
+		params->state = GBAUDIO_CODEC_STOP;
+	} else if (mute && stream) {/* stop capture */
+		ret = gb_audio_apbridgea_stop_rx(data->connection, 0);
+		if (!ret)
+			ret = gb_audio_apbridgea_shutdown_rx(data->connection, 0);
+		params->state = GBAUDIO_CODEC_STOP;
+	} else {
+		ret = -EINVAL;
+	}
+
+	if (ret)
+		dev_err_ratelimited(dai->dev,
+				    "%s:Error during %s %s stream:%d\n",
+				    module->name, mute ? "Mute" : "Unmute",
+				    stream ? "Capture" : "Playback", ret);
+
+	gb_pm_runtime_put_noidle(bundle);
+	mutex_unlock(&codec->lock);
+	return ret;
+}
+
+static const struct snd_soc_dai_ops gbcodec_dai_ops = {
+	.startup = gbcodec_startup,
+	.shutdown = gbcodec_shutdown,
+	.hw_params = gbcodec_hw_params,
+	.prepare = gbcodec_prepare,
+	.mute_stream = gbcodec_mute_stream,
+};
+
+static struct snd_soc_dai_driver gbaudio_dai[] = {
+	{
+		.name = "apb-i2s0",
+		.id = 0,
+		.playback = {
+			.stream_name = "I2S 0 Playback",
+			.rates = SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.rate_max = 48000,
+			.rate_min = 48000,
+			.channels_min = 1,
+			.channels_max = 2,
+			.sig_bits = 16,
+		},
+		.capture = {
+			.stream_name = "I2S 0 Capture",
+			.rates = SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.rate_max = 48000,
+			.rate_min = 48000,
+			.channels_min = 1,
+			.channels_max = 2,
+			.sig_bits = 16,
+		},
+		.ops = &gbcodec_dai_ops,
+	},
+};
+
+static int gbaudio_init_jack(struct gbaudio_module_info *module,
+			     struct snd_soc_card *card)
+{
+	int ret;
+	struct gbaudio_jack *jack, *n;
+	struct snd_soc_jack_pin *headset, *button;
+
+	if (!module->jack_mask)
+		return 0;
+
+	snprintf(module->jack_name, NAME_SIZE, "GB %d Headset Jack",
+		 module->dev_id);
+
+	headset = devm_kzalloc(module->dev, sizeof(*headset), GFP_KERNEL);
+	if (!headset)
+		return -ENOMEM;
+
+	headset->pin = module->jack_name;
+	headset->mask = module->jack_mask;
+	ret = snd_soc_card_jack_new_pins(card, module->jack_name,
+					 module->jack_mask,
+					 &module->headset.jack, headset, 1);
+	if (ret) {
+		dev_err(module->dev, "Failed to create new jack\n");
+		return ret;
+	}
+
+	/* Add to module's jack list */
+	list_add(&module->headset.list, &module->jack_list);
+
+	if (!module->button_mask)
+		return 0;
+
+	snprintf(module->button_name, NAME_SIZE, "GB %d Button Jack",
+		 module->dev_id);
+	button = devm_kzalloc(module->dev, sizeof(*button), GFP_KERNEL);
+	if (!button) {
+		ret = -ENOMEM;
+		goto free_jacks;
+	}
+
+	button->pin = module->button_name;
+	button->mask = module->button_mask;
+	ret = snd_soc_card_jack_new_pins(card, module->button_name,
+					 module->button_mask,
+					 &module->button.jack,
+					 button, 1);
+	if (ret) {
+		dev_err(module->dev, "Failed to create button jack\n");
+		goto free_jacks;
+	}
+
+	/* Add to module's jack list */
+	list_add(&module->button.list, &module->jack_list);
+
+	/*
+	 * Currently, max 4 buttons are supported with following key mapping
+	 * BTN_0 = KEY_MEDIA
+	 * BTN_1 = KEY_VOICECOMMAND
+	 * BTN_2 = KEY_VOLUMEUP
+	 * BTN_3 = KEY_VOLUMEDOWN
+	 */
+
+	if (module->button_mask & SND_JACK_BTN_0) {
+		ret = snd_jack_set_key(module->button.jack.jack, SND_JACK_BTN_0,
+				       KEY_MEDIA);
+		if (ret) {
+			dev_err(module->dev, "Failed to set BTN_0\n");
+			goto free_jacks;
+		}
+	}
+
+	if (module->button_mask & SND_JACK_BTN_1) {
+		ret = snd_jack_set_key(module->button.jack.jack, SND_JACK_BTN_1,
+				       KEY_VOICECOMMAND);
+		if (ret) {
+			dev_err(module->dev, "Failed to set BTN_1\n");
+			goto free_jacks;
+		}
+	}
+
+	if (module->button_mask & SND_JACK_BTN_2) {
+		ret = snd_jack_set_key(module->button.jack.jack, SND_JACK_BTN_2,
+				       KEY_VOLUMEUP);
+		if (ret) {
+			dev_err(module->dev, "Failed to set BTN_2\n");
+			goto free_jacks;
+		}
+	}
+
+	if (module->button_mask & SND_JACK_BTN_3) {
+		ret = snd_jack_set_key(module->button.jack.jack, SND_JACK_BTN_3,
+				       KEY_VOLUMEDOWN);
+		if (ret) {
+			dev_err(module->dev, "Failed to set BTN_0\n");
+			goto free_jacks;
+		}
+	}
+
+	/* FIXME
+	 * verify if this is really required
+	set_bit(INPUT_PROP_NO_DUMMY_RELEASE,
+		module->button.jack.jack->input_dev->propbit);
+	*/
+
+	return 0;
+
+free_jacks:
+	list_for_each_entry_safe(jack, n, &module->jack_list, list) {
+		snd_device_free(card->snd_card, jack->jack.jack);
+		list_del(&jack->list);
+	}
+
+	return ret;
+}
+
+int gbaudio_register_module(struct gbaudio_module_info *module)
+{
+	int ret;
+	struct snd_soc_component *comp;
+	struct snd_soc_dapm_context *dapm;
+	struct gbaudio_jack *jack = NULL;
+
+	if (!gbcodec) {
+		dev_err(module->dev, "GB Codec not yet probed\n");
+		return -EAGAIN;
+	}
+
+	comp = gbcodec->component;
+	dapm = snd_soc_component_to_dapm(comp);
+
+	mutex_lock(&gbcodec->register_mutex);
+
+	if (module->num_dais) {
+		dev_err(gbcodec->dev,
+			"%d:DAIs not supported via gbcodec driver\n",
+			module->num_dais);
+		mutex_unlock(&gbcodec->register_mutex);
+		return -EINVAL;
+	}
+
+	ret = gbaudio_init_jack(module, comp->card);
+	if (ret) {
+		mutex_unlock(&gbcodec->register_mutex);
+		return ret;
+	}
+
+	if (module->dapm_widgets)
+		snd_soc_dapm_new_controls(dapm, module->dapm_widgets,
+					  module->num_dapm_widgets);
+	if (module->controls)
+		snd_soc_add_component_controls(comp, module->controls,
+					       module->num_controls);
+	if (module->dapm_routes)
+		snd_soc_dapm_add_routes(dapm, module->dapm_routes,
+					module->num_dapm_routes);
+
+	/* card already instantiated, create widgets here only */
+	if (comp->card->instantiated) {
+		gbaudio_dapm_link_component_dai_widgets(comp->card, dapm);
+#ifdef CONFIG_SND_JACK
+		/*
+		 * register jack devices for this module
+		 * from codec->jack_list
+		 */
+		list_for_each_entry(jack, &module->jack_list, list) {
+			snd_device_register(comp->card->snd_card,
+					    jack->jack.jack);
+		}
+#endif
+	}
+
+	mutex_lock(&gbcodec->lock);
+	list_add(&module->list, &gbcodec->module_list);
+	mutex_unlock(&gbcodec->lock);
+
+	if (comp->card->instantiated)
+		ret = snd_soc_dapm_new_widgets(comp->card);
+	dev_dbg(comp->dev, "Registered %s module\n", module->name);
+
+	mutex_unlock(&gbcodec->register_mutex);
+	return ret;
+}
+EXPORT_SYMBOL(gbaudio_register_module);
+
+static void gbaudio_codec_clean_data_tx(struct gbaudio_data_connection *data)
+{
+	u16 i2s_port, cportid;
+	int ret;
+
+	if (list_is_singular(&gbcodec->module_list)) {
+		ret = gb_audio_apbridgea_stop_tx(data->connection, 0);
+		if (ret)
+			return;
+		ret = gb_audio_apbridgea_shutdown_tx(data->connection, 0);
+		if (ret)
+			return;
+	}
+	i2s_port = 0;	/* fixed for now */
+	cportid = data->connection->hd_cport_id;
+	ret = gb_audio_apbridgea_unregister_cport(data->connection,
+						  i2s_port, cportid,
+						  AUDIO_APBRIDGEA_DIRECTION_TX);
+	data->state[0] = GBAUDIO_CODEC_SHUTDOWN;
+}
+
+static void gbaudio_codec_clean_data_rx(struct gbaudio_data_connection *data)
+{
+	u16 i2s_port, cportid;
+	int ret;
+
+	if (list_is_singular(&gbcodec->module_list)) {
+		ret = gb_audio_apbridgea_stop_rx(data->connection, 0);
+		if (ret)
+			return;
+		ret = gb_audio_apbridgea_shutdown_rx(data->connection, 0);
+		if (ret)
+			return;
+	}
+	i2s_port = 0;	/* fixed for now */
+	cportid = data->connection->hd_cport_id;
+	ret = gb_audio_apbridgea_unregister_cport(data->connection,
+						  i2s_port, cportid,
+						  AUDIO_APBRIDGEA_DIRECTION_RX);
+	data->state[1] = GBAUDIO_CODEC_SHUTDOWN;
+}
+
+static void gbaudio_codec_cleanup(struct gbaudio_module_info *module)
+{
+	struct gbaudio_data_connection *data;
+	int pb_state, cap_state;
+
+	dev_dbg(gbcodec->dev, "%s: removed, cleanup APBridge\n", module->name);
+	list_for_each_entry(data, &module->data_list, list) {
+		pb_state = data->state[0];
+		cap_state = data->state[1];
+
+		if (pb_state > GBAUDIO_CODEC_SHUTDOWN)
+			gbaudio_codec_clean_data_tx(data);
+
+		if (cap_state > GBAUDIO_CODEC_SHUTDOWN)
+			gbaudio_codec_clean_data_rx(data);
+	}
+}
+
+void gbaudio_unregister_module(struct gbaudio_module_info *module)
+{
+	struct snd_soc_component *comp = gbcodec->component;
+	struct gbaudio_jack *jack, *n;
+	int mask;
+
+	dev_dbg(comp->dev, "Unregister %s module\n", module->name);
+
+	mutex_lock(&gbcodec->register_mutex);
+	mutex_lock(&gbcodec->lock);
+	gbaudio_codec_cleanup(module);
+	list_del(&module->list);
+	dev_dbg(comp->dev, "Process Unregister %s module\n", module->name);
+	mutex_unlock(&gbcodec->lock);
+
+#ifdef CONFIG_SND_JACK
+	/* free jack devices for this module jack_list */
+	list_for_each_entry_safe(jack, n, &module->jack_list, list) {
+		if (jack == &module->headset)
+			mask = GBCODEC_JACK_MASK;
+		else if (jack == &module->button)
+			mask = GBCODEC_JACK_BUTTON_MASK;
+		else
+			mask = 0;
+		if (mask) {
+			dev_dbg(module->dev, "Report %s removal\n",
+				jack->jack.jack->id);
+			snd_soc_jack_report(&jack->jack, 0, mask);
+			snd_device_free(comp->card->snd_card,
+					jack->jack.jack);
+			list_del(&jack->list);
+		}
+	}
+#endif
+
+	if (module->dapm_routes) {
+		struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(comp);
+
+		dev_dbg(comp->dev, "Removing %d routes\n",
+			module->num_dapm_routes);
+		snd_soc_dapm_del_routes(dapm, module->dapm_routes,
+					module->num_dapm_routes);
+	}
+	if (module->controls) {
+		dev_dbg(comp->dev, "Removing %d controls\n",
+			module->num_controls);
+		/* release control semaphore */
+		gbaudio_remove_component_controls(comp, module->controls,
+						  module->num_controls);
+	}
+	if (module->dapm_widgets) {
+		struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(comp);
+
+		dev_dbg(comp->dev, "Removing %d widgets\n",
+			module->num_dapm_widgets);
+		gbaudio_dapm_free_controls(dapm, module->dapm_widgets,
+					   module->num_dapm_widgets);
+	}
+
+	dev_dbg(comp->dev, "Unregistered %s module\n", module->name);
+
+	mutex_unlock(&gbcodec->register_mutex);
+}
+EXPORT_SYMBOL(gbaudio_unregister_module);
+
+/*
+ * component driver ops
+ */
+static int gbcodec_probe(struct snd_soc_component *comp)
+{
+	int i;
+	struct gbaudio_codec_info *info;
+	struct gbaudio_codec_dai *dai;
+
+	info = devm_kzalloc(comp->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->dev = comp->dev;
+	INIT_LIST_HEAD(&info->module_list);
+	mutex_init(&info->lock);
+	mutex_init(&info->register_mutex);
+	INIT_LIST_HEAD(&info->dai_list);
+
+	/* init dai_list used to maintain runtime stream info */
+	for (i = 0; i < ARRAY_SIZE(gbaudio_dai); i++) {
+		dai = devm_kzalloc(comp->dev, sizeof(*dai), GFP_KERNEL);
+		if (!dai)
+			return -ENOMEM;
+		dai->id = gbaudio_dai[i].id;
+		list_add(&dai->list, &info->dai_list);
+	}
+
+	info->component = comp;
+	snd_soc_component_set_drvdata(comp, info);
+	gbcodec = info;
+
+	device_init_wakeup(comp->dev, 1);
+	return 0;
+}
+
+static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
+			 unsigned int value)
+{
+	return 0;
+}
+
+static unsigned int gbcodec_read(struct snd_soc_component *comp,
+				 unsigned int reg)
+{
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_gbaudio = {
+	.probe	= gbcodec_probe,
+	.read = gbcodec_read,
+	.write = gbcodec_write,
+};
+
+#ifdef CONFIG_PM
+static int gbaudio_codec_suspend(struct device *dev)
+{
+	dev_dbg(dev, "%s: suspend\n", __func__);
+	return 0;
+}
+
+static int gbaudio_codec_resume(struct device *dev)
+{
+	dev_dbg(dev, "%s: resume\n", __func__);
+	return 0;
+}
+
+static const struct dev_pm_ops gbaudio_codec_pm_ops = {
+	.suspend	= gbaudio_codec_suspend,
+	.resume		= gbaudio_codec_resume,
+};
+#endif
+
+static int gbaudio_codec_probe(struct platform_device *pdev)
+{
+	return devm_snd_soc_register_component(&pdev->dev,
+			&soc_codec_dev_gbaudio,
+			gbaudio_dai, ARRAY_SIZE(gbaudio_dai));
+}
+
+static const struct of_device_id greybus_asoc_machine_of_match[]  = {
+	{ .compatible = "toshiba,apb-dummy-codec", },
+	{},
+};
+
+static struct platform_driver gbaudio_codec_driver = {
+	.driver = {
+		.name = "apb-dummy-codec",
+#ifdef CONFIG_PM
+		.pm = &gbaudio_codec_pm_ops,
+#endif
+		.of_match_table = greybus_asoc_machine_of_match,
+	},
+	.probe = gbaudio_codec_probe,
+};
+module_platform_driver(gbaudio_codec_driver);
+
+MODULE_DESCRIPTION("APBridge ALSA SoC dummy codec driver");
+MODULE_AUTHOR("Vaibhav Agarwal <vaibhav.agarwal@linaro.org>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:apb-dummy-codec");
-- 
2.53.0

