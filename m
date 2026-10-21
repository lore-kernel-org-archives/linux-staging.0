Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792600498;
	b=KLRKnWY8KXeLeojPL/FDmENFuyUqQ11QfYGKh6DJsy0av9IacNc6ixsjKLGzJlHR71YW
	 oiX9l0NRDvVUxHp3WRRJHbxOMPCrZf7ha1kHLt5RtiW1Ochj9QZK9UT+GLfYn6o6Pj219
	 0ysjPJRg+tohH+bgnfVN1I4EVzK/yPUd09whImGaAxkiJnTVz6bogWd/d2swjaPs8faUv
	 ksa2RPF+gXYO31yXigZvsMquPeC6YEJeq8ayVZyW34f4s0OQlsGYI1Dcoe0H4r2SsNURG
	 09ukh1+pA8S2ysZ0XZ+wIEYVwgZDFcWBGNmNFEvBQESJuXkSqXVbwst/gWaJmcLv+ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ayZ4KAzkhpA5edhgEaDsIOeMkKM2meiD5dZJxqJUK/I=;
	b=DlnmmNVeWGXMaTVI8mtNZVyfnUI6TktwmH1/6NhfrobR9b2oCK1CwfovTP1ASQ+f1GXR
	 5+HOvMvF4p9654UEvVz9gwFFhqD6Gc9fISnEwRhy8N//kJzbcmSumJ7k0nsQphDRa1vNp
	 qXDqAJx91+orKEHa8h+ZtKED10k/1VaTIWIl7tSk1aPOSHXIQpmwCMeNMat1K+eMvOyg7
	 4wkMroIanyjflUGy5NEvJeMJg4PeUsbB3C0p4YjWJWV6fevsa+u0xpUa6FQYQ+jU7Iwrt
	 Y/3Ry7AyVeJIe8w6CF9ox0Z/LLLQWG39klffsmqsm3E+sGNP/Ihqpg1hSqJaQ+ujBOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FovNFrYe;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C97606A31D
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 16:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C97606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FovNFrYe
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-157fe9d771bso1200964c88.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792600492; x=1793205292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayZ4KAzkhpA5edhgEaDsIOeMkKM2meiD5dZJxqJUK/I=;
        b=FovNFrYeOlYzVTLS9IYUq/LphXfJ9b9NmQXezYZK8z585OFGulOssjW/FNoQFBnIqf
         aYwbdL0i/c8NceRlDANncMyjVnJJjEKVnS9fYw0ybrHLAzk79V9j3pUMqgzEfa49Py3z
         u0u1W8wSOJVWSwp4ZOufxm4D6w574XQj5Oaok3Mf3PiadVKeUoTh2zF1FcnHX6UKKF1z
         aD38ihcqX9VL2CNcjuFCeA31mSJ1tNKsdrf9UMwIKGF4Z0S5xD1JwtIFp8UraculpCBK
         P1M6Vbdy5T55VqWHHBRa4HHTzWVzyLNDOa9Y5UcW0G+1UlB0tJjoEcfjlNnDWwVXKgcw
         qylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600492; x=1793205292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayZ4KAzkhpA5edhgEaDsIOeMkKM2meiD5dZJxqJUK/I=;
        b=bm5KYNc/GCbw0SKbrBe6Ao/B4YMcKOx2gbLuXwEdJ6buuHWjx/ibkoqI+4n6Zf6CZv
         +aKGAjasyMJYwjib/yLSutnDmwW9FMb+gUoZzwd6sWs42h1CRI0BitB/gunUbFk6ktwQ
         j+iZQGFcwosIgnaMbZf7+mtMKYYoKGrSciaUK6yDdQ0Y84/4NbYu3fM8olRVcMFc3Wvu
         ua3XtDVwaC+MNlqreO62sYXEtuhvYZHK5AzRBk/q4I8hQbtBIF/StZ1CWHV52kx1+gaH
         EsZdjNzSb/twOnYtVs12QOh5GO0uz1x1oM7bS6l+VUvyS9gS5V9LEvJIUIihm++szzSj
         IqUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhomjpNymjIOtoSwGZaRIayzinLvOjKBwPsR9pijckj4u9hjR/MfkBY5FuYm2FNMmnWFIZINbAO2XIv39f@lists.linux.dev
X-Gm-Message-State: AFq9FYI9lh78EwBHIwzdqrII+6BzgSAM7zaqkEss+WMBt5fWWZbxBNiJ
	Bl1W3jonjYEmS1F4bei3JyL9xGD7nNH1Gr7YAZtUbDcUbinJlMRnIB34
X-Gm-Gg: AYBFou3OMz3fBxfSBv7jpAUc4bhkmxo2BGVjtfT6rHMRMVy9go/HKlTUNDDCUw4L9gz
	37iao2BLbpEsek/cAPO8E3M6koTEUEN3oYdd9VDyX8pCdn+4IKUQBvUyuywiy3iBEwvFtbxb4PG
	ZXxEGIapDvFabrTfYWTu+fKLxvj7rZIULDFaR9seCddoe52KZs9vC+nGZiFSd3xMvCFDLf+UekX
	aabxDHLtO6ukxy3i/zFyj3WYQ6o5ILOzzjWwXJCRE6RTwaCNl2u4u29UxUwBs7wDooszeaN4bg9
	hlBe2SFlhV7rZg0qlajJdA9Oru1pAkfMO+Wic4a1QXbwZ6TEoGfe/ybSt/ZP5Gz/TYvohU22PYG
	luKslsaNEhV6RJI8p2WqO3KHxjQosegVYf/mduQsPJ5ITggkPOkSC3R4NeGDYmc0UEe7fpkxc+M
	Xh+3Yr6LmGmeWPEQ2ol/jf0d0J8nhE4SQvTE/qu2zzbjkxig5aBj5QDhV32Or4kvcQdXGpZ5lU7
	xbl4g8TpoPSt96EG2PUGZzzuFUZ3N7KwP7xuxqN8JA0D+snCY/1Jii7gom3RKXH+70SgMbktruz
	lDH7uzcoZw==
X-Received: by 2002:a05:701a:ca01:b0:181:5cac:8f27 with SMTP id a92af1059eb24-190a6dbd80amr3509832c88.35.1792600489109;
        Wed, 21 Oct 2026 09:34:49 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:6b11:befa:8369:3fe1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm11432616c88.5.2026.10.21.09.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:34:48 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	vireshk@kernel.org,
	rmfrfs@gmail.com,
	dtwlin@gmail.com,
	pure.logic@nexus-software.ie,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH] staging: greybus: Replace format specifiers
Date: Wed, 21 Oct 2026 22:04:37 +0530
Message-ID: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Unsigned variables are printed using %d.
Replace them with %u to match their types.

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/staging/greybus/audio_codec.c    | 20 ++++++++--------
 drivers/staging/greybus/audio_topology.c | 30 ++++++++++++------------
 drivers/staging/greybus/bootrom.c        |  2 +-
 drivers/staging/greybus/fw-download.c    |  2 +-
 drivers/staging/greybus/fw-management.c  |  2 +-
 drivers/staging/greybus/gpio.c           |  2 +-
 drivers/staging/greybus/light.c          |  2 +-
 drivers/staging/greybus/log.c            |  4 ++--
 drivers/staging/greybus/loopback.c       |  4 ++--
 drivers/staging/greybus/power_supply.c   |  2 +-
 drivers/staging/greybus/raw.c            |  2 +-
 drivers/staging/greybus/sdio.c           |  4 ++--
 drivers/staging/greybus/spilib.c         |  2 +-
 drivers/staging/greybus/uart.c           |  4 ++--
 14 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 6daa4e706792..a66c2ee9c808 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -78,7 +78,7 @@ static int gbaudio_module_enable_tx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_STARTUP;
-		dev_dbg(module->dev, "Dynamic Register %d DAI\n", cportid);
+		dev_dbg(module->dev, "Dynamic Register %u DAI\n", cportid);
 	}
 
 	/* hw_params */
@@ -95,7 +95,7 @@ static int gbaudio_module_enable_tx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_HWPARAMS;
-		dev_dbg(module->dev, "Dynamic hw_params %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic hw_params %u DAI\n", data_cport);
 	}
 
 	/* prepare */
@@ -116,7 +116,7 @@ static int gbaudio_module_enable_tx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_PREPARE;
-		dev_dbg(module->dev, "Dynamic prepare %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic prepare %u DAI\n", data_cport);
 	}
 
 	return 0;
@@ -146,7 +146,7 @@ static int gbaudio_module_disable_tx(struct gbaudio_module_info *module, int id)
 					    "deactivate_tx failed:%d\n", ret);
 			return ret;
 		}
-		dev_dbg(module->dev, "Dynamic deactivate %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic deactivate %u DAI\n", data_cport);
 		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_HWPARAMS;
 	}
 
@@ -161,7 +161,7 @@ static int gbaudio_module_disable_tx(struct gbaudio_module_info *module, int id)
 					    "unregister_cport failed:%d\n", ret);
 			return ret;
 		}
-		dev_dbg(module->dev, "Dynamic Unregister %d DAI\n", cportid);
+		dev_dbg(module->dev, "Dynamic Unregister %u DAI\n", cportid);
 		data->state[SNDRV_PCM_STREAM_PLAYBACK] = GBAUDIO_CODEC_SHUTDOWN;
 	}
 
@@ -204,7 +204,7 @@ static int gbaudio_module_enable_rx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_STARTUP;
-		dev_dbg(module->dev, "Dynamic Register %d DAI\n", cportid);
+		dev_dbg(module->dev, "Dynamic Register %u DAI\n", cportid);
 	}
 
 	/* hw_params */
@@ -221,7 +221,7 @@ static int gbaudio_module_enable_rx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_HWPARAMS;
-		dev_dbg(module->dev, "Dynamic hw_params %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic hw_params %u DAI\n", data_cport);
 	}
 
 	/* prepare */
@@ -243,7 +243,7 @@ static int gbaudio_module_enable_rx(struct gbaudio_codec_info *codec,
 			return ret;
 		}
 		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_PREPARE;
-		dev_dbg(module->dev, "Dynamic prepare %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic prepare %u DAI\n", data_cport);
 	}
 
 	return 0;
@@ -273,7 +273,7 @@ static int gbaudio_module_disable_rx(struct gbaudio_module_info *module, int id)
 					    "deactivate_rx failed:%d\n", ret);
 			return ret;
 		}
-		dev_dbg(module->dev, "Dynamic deactivate %d DAI\n", data_cport);
+		dev_dbg(module->dev, "Dynamic deactivate %u DAI\n", data_cport);
 		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_HWPARAMS;
 	}
 
@@ -288,7 +288,7 @@ static int gbaudio_module_disable_rx(struct gbaudio_module_info *module, int id)
 					    "unregister_cport failed:%d\n", ret);
 			return ret;
 		}
-		dev_dbg(module->dev, "Dynamic Unregister %d DAI\n", cportid);
+		dev_dbg(module->dev, "Dynamic Unregister %u DAI\n", cportid);
 		data->state[SNDRV_PCM_STREAM_CAPTURE] = GBAUDIO_CODEC_SHUTDOWN;
 	}
 
diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddc..a5edf2ff009b 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -199,7 +199,7 @@ static int gbcodec_mixer_ctl_info(struct snd_kcontrol *kcontrol,
 		strscpy(uinfo->value.enumerated.name, name, sizeof(uinfo->value.enumerated.name));
 		break;
 	default:
-		dev_err(comp->dev, "Invalid type: %d for %s:kcontrol\n",
+		dev_err(comp->dev, "Invalid type: %u for %s:kcontrol\n",
 			info->type, kcontrol->id.name);
 		break;
 	}
@@ -260,7 +260,7 @@ static int gbcodec_mixer_ctl_get(struct snd_kcontrol *kcontrol,
 				le32_to_cpu(gbvalue.value.enumerated_item[1]);
 		break;
 	default:
-		dev_err(comp->dev, "Invalid type: %d for %s:kcontrol\n",
+		dev_err(comp->dev, "Invalid type: %u for %s:kcontrol\n",
 			info->type, kcontrol->id.name);
 		ret = -EINVAL;
 		break;
@@ -307,7 +307,7 @@ static int gbcodec_mixer_ctl_put(struct snd_kcontrol *kcontrol,
 				cpu_to_le32(ucontrol->value.enumerated.item[1]);
 		break;
 	default:
-		dev_err(comp->dev, "Invalid type: %d for %s:kcontrol\n",
+		dev_err(comp->dev, "Invalid type: %u for %s:kcontrol\n",
 			info->type, kcontrol->id.name);
 		ret = -EINVAL;
 		break;
@@ -655,7 +655,7 @@ static int gbaudio_tplg_create_enum_kctl(struct gbaudio_module_info *gb,
 		return -ENOMEM;
 
 	/* debug enum info */
-	dev_dbg(gb->dev, "Max:%d, name_length:%d\n", gbe->items,
+	dev_dbg(gb->dev, "Max:%u, name_length:%u\n", gbe->items,
 		le16_to_cpu(gb_enum->names_length));
 	for (i = 0; i < gbe->items; i++)
 		dev_dbg(gb->dev, "src[%d]: %s\n", i, gbe->texts[i]);
@@ -700,7 +700,7 @@ static int gbaudio_tplg_create_kcontrol(struct gbaudio_module_info *gb,
 		return -EINVAL;
 	}
 
-	dev_dbg(gb->dev, "%s:%d control created\n", ctl->name, ctl->id);
+	dev_dbg(gb->dev, "%s:%u control created\n", ctl->name, ctl->id);
 	return ret;
 }
 
@@ -861,7 +861,7 @@ static int gbaudio_tplg_create_enum_ctl(struct gbaudio_module_info *gb,
 		return -ENOMEM;
 
 	/* debug enum info */
-	dev_dbg(gb->dev, "Max:%d, name_length:%d\n", gbe->items,
+	dev_dbg(gb->dev, "Max:%u, name_length:%u\n", gbe->items,
 		le16_to_cpu(gb_enum->names_length));
 	for (i = 0; i < gbe->items; i++)
 		dev_dbg(gb->dev, "src[%d]: %s\n", i, gbe->texts[i]);
@@ -914,7 +914,7 @@ static int gbaudio_tplg_create_wcontrol(struct gbaudio_module_info *gb,
 		return -EINVAL;
 	}
 
-	dev_dbg(gb->dev, "%s:%d DAPM control created, ret:%d\n", ctl->name,
+	dev_dbg(gb->dev, "%s:%u DAPM control created, ret:%d\n", ctl->name,
 		ctl->id, ret);
 	return ret;
 }
@@ -1022,7 +1022,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	ret = gbaudio_validate_kcontrol_count(w);
 	if (ret) {
-		dev_err(module->dev, "Invalid kcontrol count=%d for %s\n",
+		dev_err(module->dev, "Invalid kcontrol count=%u for %s\n",
 			w->ncontrols, w->name);
 		return ret;
 	}
@@ -1044,7 +1044,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 						   curr);
 		if (ret) {
 			dev_err(module->dev,
-				"%s:%d type widget_ctl not supported\n",
+				"%s:%u type widget_ctl not supported\n",
 				curr->name, curr->iface);
 			goto error;
 		}
@@ -1155,7 +1155,7 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		ret = gbaudio_tplg_create_kcontrol(module, &dapm_kctls[i],
 						   curr);
 		if (ret) {
-			dev_err(module->dev, "%s:%d type not supported\n",
+			dev_err(module->dev, "%s:%u type not supported\n",
 				curr->name, curr->iface);
 			goto error;
 		}
@@ -1192,7 +1192,7 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		}
 
 		list_add(&control->list, &module->ctl_list);
-		dev_dbg(module->dev, "%d:%s created of type %d\n", curr->id,
+		dev_dbg(module->dev, "%u:%s created of type %u\n", curr->id,
 			curr->name, curr->info.type);
 		curr = (void *)curr + csize;
 	}
@@ -1228,7 +1228,7 @@ static int gbaudio_tplg_process_widgets(struct gbaudio_module_info *module,
 		ret = gbaudio_tplg_create_widget(module, &dapm_widgets[i],
 						 curr, &w_size);
 		if (ret) {
-			dev_err(module->dev, "%s:%d type not supported\n",
+			dev_err(module->dev, "%s:%u type not supported\n",
 				curr->name, curr->type);
 			goto error;
 		}
@@ -1278,7 +1278,7 @@ static int gbaudio_tplg_process_routes(struct gbaudio_module_info *module,
 		dapm_routes->sink =
 			gbaudio_map_widgetid(module, curr->destination_id);
 		if (!dapm_routes->sink) {
-			dev_err(module->dev, "%d:%d:%d:%d - Invalid sink\n",
+			dev_err(module->dev, "%u:%u:%u:%u - Invalid sink\n",
 				curr->source_id, curr->destination_id,
 				curr->control_id, curr->index);
 			ret = -EINVAL;
@@ -1287,7 +1287,7 @@ static int gbaudio_tplg_process_routes(struct gbaudio_module_info *module,
 		dapm_routes->source =
 			gbaudio_map_widgetid(module, curr->source_id);
 		if (!dapm_routes->source) {
-			dev_err(module->dev, "%d:%d:%d:%d - Invalid source\n",
+			dev_err(module->dev, "%u:%u:%u:%u - Invalid source\n",
 				curr->source_id, curr->destination_id,
 				curr->control_id, curr->index);
 			ret = -EINVAL;
@@ -1299,7 +1299,7 @@ static int gbaudio_tplg_process_routes(struct gbaudio_module_info *module,
 					      curr->index);
 		if ((curr->control_id !=  GBAUDIO_INVALID_ID) &&
 		    !dapm_routes->control) {
-			dev_err(module->dev, "%d:%d:%d:%d - Invalid control\n",
+			dev_err(module->dev, "%u:%u:%u:%u - Invalid control\n",
 				curr->source_id, curr->destination_id,
 				curr->control_id, curr->index);
 			ret = -EINVAL;
diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c322..fb1fbd3f7b99 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -222,7 +222,7 @@ static int gb_bootrom_firmware_size_request(struct gb_operation *op)
 	size_response = op->response->payload;
 	size_response->size = cpu_to_le32(bootrom->fw->size);
 
-	dev_dbg(dev, "%s: firmware size %d bytes\n",
+	dev_dbg(dev, "%s: firmware size %u bytes\n",
 		__func__, size_response->size);
 
 unlock:
diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
index a0a683447b3d..9f7f68411418 100644
--- a/drivers/staging/greybus/fw-download.c
+++ b/drivers/staging/greybus/fw-download.c
@@ -148,7 +148,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
 		return 0;
 
 	dev_err(fw_download->parent,
-		"Firmware download didn't finish in time, abort: %d\n",
+		"Firmware download didn't finish in time, abort: %u\n",
 		fw_req->firmware_id);
 
 	fw_req->timedout = true;
diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 5d01da6b6eb9..ee86ed9686c4 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -141,7 +141,7 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
 	if (load_method != GB_FW_LOAD_METHOD_UNIPRO &&
 	    load_method != GB_FW_LOAD_METHOD_INTERNAL) {
 		dev_err(fw_mgmt->parent,
-			"invalid load-method (%d)\n", load_method);
+			"invalid load-method (%u)\n", load_method);
 		return -EINVAL;
 	}
 
diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 12185f7a982c..7616bcc23c6c 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -379,7 +379,7 @@ static int gb_gpio_request_handler(struct gb_operation *op)
 
 	event = request->payload;
 	if (event->which > ggc->line_max) {
-		dev_err(dev, "invalid hw irq: %d\n", event->which);
+		dev_err(dev, "invalid hw irq: %u\n", event->which);
 		return -EINVAL;
 	}
 
diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..1fbd80523d4e 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1221,7 +1221,7 @@ static int gb_lights_request_handler(struct gb_operation *op)
 
 	if (light_id >= glights->lights_count ||
 	    !glights->lights[light_id].ready) {
-		dev_err(dev, "Event received for unconfigured light id: %d\n",
+		dev_err(dev, "Event received for unconfigured light id: %u\n",
 			light_id);
 		return -EINVAL;
 	}
diff --git a/drivers/staging/greybus/log.c b/drivers/staging/greybus/log.c
index 815d20ba9b6b..24f5d5cf21be 100644
--- a/drivers/staging/greybus/log.c
+++ b/drivers/staging/greybus/log.c
@@ -36,7 +36,7 @@ static int gb_log_request_handler(struct gb_operation *op)
 	receive = op->request->payload;
 	len = le16_to_cpu(receive->len);
 	if (len != (op->request->payload_size - sizeof(*receive))) {
-		dev_err(dev, "log request wrong size %d vs %zu\n", len,
+		dev_err(dev, "log request wrong size %u vs %zu\n", len,
 			(op->request->payload_size - sizeof(*receive)));
 		return -EINVAL;
 	}
@@ -46,7 +46,7 @@ static int gb_log_request_handler(struct gb_operation *op)
 	}
 
 	if (len > GB_LOG_MAX_LEN) {
-		dev_err(dev, "log request too big: %d\n", len);
+		dev_err(dev, "log request too big: %u\n", len);
 		return -EINVAL;
 	}
 
diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..d06402dd3f60 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -424,7 +424,7 @@ static void gb_loopback_async_operation_callback(struct gb_operation *operation)
 
 	mutex_unlock(&gb->mutex);
 
-	dev_dbg(&gb->connection->bundle->dev, "complete operation %d\n",
+	dev_dbg(&gb->connection->bundle->dev, "complete operation %u\n",
 		operation->id);
 
 	/* Wake up waiters */
@@ -579,7 +579,7 @@ static int gb_loopback_async_transfer_complete(struct gb_loopback_async_operatio
 
 	if (memcmp(request->data, response->data, len)) {
 		dev_err(&gb->connection->bundle->dev,
-			"Loopback Data doesn't match operation id %d\n",
+			"Loopback Data doesn't match operation id %u\n",
 			operation->id);
 		retval = -EREMOTEIO;
 	} else {
diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
index beefcbaf3681..1eeccf452eaf 100644
--- a/drivers/staging/greybus/power_supply.c
+++ b/drivers/staging/greybus/power_supply.c
@@ -1011,7 +1011,7 @@ static int gb_supplies_request_handler(struct gb_operation *op)
 	if (psy_id >= supplies->supplies_count ||
 	    !supplies->supply[psy_id].registered) {
 		dev_err(&connection->bundle->dev,
-			"Event received for unconfigured power_supply id: %d\n",
+			"Event received for unconfigured power_supply id: %u\n",
 			psy_id);
 		ret = -EINVAL;
 		goto out_unlock;
diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 4f1b3f4db404..2314496a858a 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -112,7 +112,7 @@ static int gb_raw_request_handler(struct gb_operation *op)
 	receive = op->request->payload;
 	len = le32_to_cpu(receive->len);
 	if (len != (int)(op->request->payload_size - sizeof(__le32))) {
-		dev_err(dev, "raw receive request wrong size %d vs %d\n", len,
+		dev_err(dev, "raw receive request wrong size %u vs %d\n", len,
 			(int)(op->request->payload_size - sizeof(__le32)));
 		return -EINVAL;
 	}
diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
index 3952f3d225db..773ec1f72407 100644
--- a/drivers/staging/greybus/sdio.c
+++ b/drivers/staging/greybus/sdio.c
@@ -294,7 +294,7 @@ static int _gb_sdio_send(struct gb_sdio_host *host, struct mmc_data *data,
 	send_blksz = le16_to_cpu(response->data_blksz);
 
 	if (len != send_blksz * send_blocks) {
-		dev_err(mmc_dev(host->mmc), "send: size received: %zu != %d\n",
+		dev_err(mmc_dev(host->mmc), "send: size received: %zu != %u\n",
 			len, send_blksz * send_blocks);
 		ret = -EINVAL;
 	}
@@ -340,7 +340,7 @@ static int _gb_sdio_recv(struct gb_sdio_host *host, struct mmc_data *data,
 	recv_blksz = le16_to_cpu(response->data_blksz);
 
 	if (len != recv_blksz * recv_blocks) {
-		dev_err(mmc_dev(host->mmc), "recv: size received: %d != %zu\n",
+		dev_err(mmc_dev(host->mmc), "recv: size received: %u != %zu\n",
 			recv_blksz * recv_blocks, len);
 		ret = -EINVAL;
 		goto err_put_operation;
diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index c1982f3fb931..6e34757d9051 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -540,7 +540,7 @@ int gb_spilib_master_init(struct gb_connection *connection, struct device *dev,
 	for (i = 0; i < spi->num_chipselect; i++) {
 		ret = gb_spi_setup_device(spi, i);
 		if (ret < 0) {
-			dev_err(dev, "failed to allocate spi device %d: %d\n",
+			dev_err(dev, "failed to allocate spi device %u: %d\n",
 				i, ret);
 			goto exit_spi_unregister;
 		}
diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 2448fc9098d6..442aad685d33 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -176,7 +176,7 @@ static int gb_uart_receive_credits_handler(struct gb_operation *op)
 
 	if (ret) {
 		dev_err(&gb_tty->gbphy_dev->dev,
-			"invalid number of incoming credits: %d\n",
+			"invalid number of incoming credits: %u\n",
 			incoming_credits);
 		return ret;
 	}
@@ -300,7 +300,7 @@ static int send_break(struct gb_tty *gb_tty, u8 state)
 
 	if ((state != 0) && (state != 1)) {
 		dev_err(&gb_tty->gbphy_dev->dev,
-			"invalid break state of %d\n", state);
+			"invalid break state of %u\n", state);
 		return -EINVAL;
 	}
 
-- 
2.43.0

