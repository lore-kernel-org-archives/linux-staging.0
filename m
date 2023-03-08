Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDCB7B
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 07:35:27 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id ec29so31188661edb.6
        for <linux-staging@lists.linux.dev>; Tue, 07 Mar 2023 23:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlkyO8OW+WgRQk2FFiUYUZ/IqArcuXEwbJRily5asgc=;
        b=gfFE6M8DHtIav5RU6MsJ3sTZtpxapVJLnD8kVuiiozcjPo1XQt7IOzULrdEeV6Ahgs
         iUWujv1S+BM7sNUt1+eH9PhUb48XhuuB2bfK+8kmt10oXE804Y0eJw4HShFnmVMJS+q0
         MZaeF+1WVM2fBRbuxRN7i9bC99UNr+pqarOQX6snESecTdHoQaZGuEMSR2YC8xViyjmZ
         z4mgfTI9lSSJv4a7kRoo+owwHnE5E+R0wnLHLm/2+RLks9ascL54EsewO0uHEOCegjF9
         AONbZtwPe9uWywrlVKLkJQqTCR0MwysL3in3OytvhQWFFAzP9Nl6LFWaIBnSY16qus/a
         f68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlkyO8OW+WgRQk2FFiUYUZ/IqArcuXEwbJRily5asgc=;
        b=GkSreFGwVLBjWGGLuxTrAfrRgb14vaDsr/bbILMAIyfXdr9RuS28kGgDujxjdz+oW2
         8iPoUO1zbnTcYsQg7weqONtRTxEwJo/9A8kWv7rYuwWuHSMcjOxkNwfaxxDw+gnNwlO3
         XFeJM07iJB3ldjl1hryYzJ2bBN4inE7awJoOQhP2kd7/8tGMkKxyCpwJDlorG2Tlbipe
         GyDycrID6t49Ug2FrY0YZyk8nCDJ5OegnFtMqD1onwxCpmJffs6GHxOIFUvBtlW6iPoL
         PHWiOwANA7RqlN/Mk7x6RDbJgpgnn6578Gci80ZCrl30gQ9lqidnXt4XP1s4P07HjoJ2
         ZeYQ==
X-Gm-Message-State: AO0yUKVwjwZhwSwYIyv4c2Jqo94BFt24ukm05EMTPYKA6t0p4OFmtOzB
	r9gIH69Y53IVqGTMaETBNeM=
X-Google-Smtp-Source: AK7set8wJa4R62qf3wc3kdQ1c8vp1MPY3uW4wwyBLP60VdjYnr0RAEWRy/Eqj8agSppBc4asejUskw==
X-Received: by 2002:a17:907:2bde:b0:906:2b5c:7390 with SMTP id gv30-20020a1709072bde00b009062b5c7390mr15767615ejc.16.1678260925211;
        Tue, 07 Mar 2023 23:35:25 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 2/8] ASoC: tegra: Support coupled mic-hp detection
Date: Wed,  8 Mar 2023 09:34:56 +0200
Message-Id: <20230308073502.5421-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This quirk is used for cases when there is GPIO which detects
any type of 3.5 Jack insertion and actual type of jack is defined
by other GPIO. 3.5 Jack GPIO generates interrupt and MIC GPIO
indicates type of Jack only if 3.5 Jack GPIO is active.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 78faa8bcae27..7b6d5d90c3a2 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -51,6 +51,17 @@ static struct snd_soc_jack_gpio tegra_machine_headset_jack_gpio = {
 };
 
 /* Mic Jack */
+static int coupled_mic_hp_check(void *data)
+{
+	struct tegra_machine *machine = (struct tegra_machine *)data;
+
+	/* Detect mic insertion only if 3.5 jack is in */
+	if (gpiod_get_value_cansleep(machine->gpiod_hp_det) &&
+	    gpiod_get_value_cansleep(machine->gpiod_mic_det))
+		return SND_JACK_MICROPHONE;
+
+	return 0;
+}
 
 static struct snd_soc_jack tegra_machine_mic_jack;
 
@@ -183,8 +194,15 @@ int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
 			return err;
 		}
 
+		tegra_machine_mic_jack_gpio.data = machine;
 		tegra_machine_mic_jack_gpio.desc = machine->gpiod_mic_det;
 
+		if (of_property_read_bool(card->dev->of_node,
+					  "nvidia,coupled-mic-hp-det")) {
+			tegra_machine_mic_jack_gpio.desc = machine->gpiod_hp_det;
+			tegra_machine_mic_jack_gpio.jack_status_check = coupled_mic_hp_check;
+		};
+
 		err = snd_soc_jack_add_gpios(&tegra_machine_mic_jack, 1,
 					     &tegra_machine_mic_jack_gpio);
 		if (err)
-- 
2.37.2

