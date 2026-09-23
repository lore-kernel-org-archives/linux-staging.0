Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A213815FA
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 02:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130871; cv=none; b=ij08i/1YvYdMe/wtH/CbBFznuGba57Xikyz/W04BWpQdjHuDZR4d7hrD10zK7gRk3zSQVdHvME5WEIMcOPK/DEsvRXRzecthu6k4KOJ0v78pgv4u7DN5jqw7JvY4OBibWn20EePakDfOhIOVrArRSmimBrlSmz8QMOFTC0Zh4ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130871; c=relaxed/simple;
	bh=RuC+pKhSD2K/27dctlbOdpdt9wqEB4Yvn2GPASfZbfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BI5iFqlW9FGYzEnW9vSh2Pgg8tAcPLcgH4HZiXsb8mMJDsHZ28R4Jajeog+ngjSol96bFQ2JPEdNHtU7QwqpMu0eMUoLbbkWiBE9atva3rNlTBvSTwUQ54iFbzALSx63sz1rqJMPlPLfnpXpNu4DVFfCPoZKVHkawPR4JBwfdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJVVi78B; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJVVi78B"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so1921415e9.1
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 19:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130868; x=1790735668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QW+BLYCi+D5tYXln7s8opXbqlHXi6CiL8jzKDo+UXSI=;
        b=BJVVi78B1nPgb3IPj9hYTN/WDAHirnUANvUP94W8WrjAykvSq3fe9UFSZceq+OaRrf
         +2r+xABdwgmKnX9QxD39okv4WbtFnIaDgC/Hfl1pBbLhRA80eKV/jTQHvUX/FwCflTON
         6LAfxUtEBv2dmuiYk3SR1PfJSz9raWobH9DGoxqE4cALRe263BQBnZM9IftHkwp1wnFM
         JUe3za2NrxT+KEuv0+MfQJdvZfC0vlaWHrqRMzyDoNLRz7hWdaapUznIo+2GdmSCY/w2
         kXqx4kuZMEzDPK3qc84E6Q+PzyNElFseZFAeBD+iJ6ChkamrdOECXfhgaIGBG/o/sNY9
         S+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130868; x=1790735668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QW+BLYCi+D5tYXln7s8opXbqlHXi6CiL8jzKDo+UXSI=;
        b=ntpVVvVnN1veWH/np11oUmMMoP0stu0N4t9cEa011Awb+n7jP5qErezK4BZcjqSLV+
         s0eCr+8PnXA3CfkylbqwxZy24rx5dLNTvZLBbucGLe8kt5EtsWutCw/LfEbxccJhnwCJ
         khozvhumcx74FG4EOQ704QbN4jFpmgVFtqsfFEX/0lahWm9PSw1AMkViDFMg/xRGptH3
         IonfWxD/2rGUs95ywcRkDZ5HynCFoUMO97ugxiWBUrfLcKsyXYVOG/YRlCDAXwl7ZG/U
         897YSj711/xsCwNm+0/99KOY8l4myjbSLAp9fnAPuVWJQhCBzmutNrAzviHhZj716U4J
         VgOg==
X-Forwarded-Encrypted: i=1; AKwUvBx8dWQKLwcezRYakVn2lz6ySOg/8QvYxKrDHU5a3+fTpBZlkE5U9FySd1DAtgj6tSb1SGRr+VUv3+W8qccw@lists.linux.dev
X-Gm-Message-State: AFuF++kq9baQHTPbYWvfEUiBkpxjUl4zkwbSeTcfvmp3VxO2bCtYdasZ
	IHRhihpT1XQZAX7WuLWrxZcAwfu59iBXVRrO2RDTAbqMQbam9OqulUwa
X-Gm-Gg: AYBFou26GbcOgmc4szDdLws0N7/lgrEdLiugHuEet+Ohl+N/0A0Ly9dqKgt/oIqCY08
	ePvHSC7j3YM4AsAao2GmNAfAbl8lMTJyls1gaFejmOwLSTQLvRRbuOhbPuCyF/q8pkDIFrBRx8S
	1cFFnwudDeNqgjLW6gixWBIsZ689wlTTke5zVNf+dksri4+TIR1D0+hvdCktPdrtlvUJ9YYW+dC
	Rn19+jroqgYt+HV6FYXJm6dhSYpdEzudxxNnRdqng/OEvusg2pWlpwVHSJXSydsPOlq6VG94Tkl
	daWk15hPYTqVSJllB4s8RgKf/OhJlhqUBCZdJBAqzSv82v6x5dal4UGzNMGI12EQCQUQRTPO/jN
	T2MOHUwnW1sA7VSe01GKZM/Yp9GvUinbN/oEKaL1Ld44NccXzH0/uaba8pMv/8JRVyHG4iOxu31
	ulSQMY57pkAVrrFVkAf2Q4GuFOpw/yiaJzVIGkTg4cBx6WVV9sULSx7ZM5pVU9piiX
X-Received: by 2002:a05:600c:3b84:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49fdecd5957mr14036365e9.11.1790130868455;
        Tue, 22 Sep 2026 19:34:28 -0700 (PDT)
Received: from linux ([205.237.104.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm2879532f8f.19.2026.09.22.19.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:34:28 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] staging: greybus: avoid snprintf truncation in audio topology
Date: Wed, 23 Sep 2026 04:34:05 +0200
Message-ID: <20260923023405.41700-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building with W=1 reports format truncation warnings when prefixing
the Greybus device id to widget and control names.

The destination buffers are NAME_SIZE bytes, while the copied topology
names may already take most of that space. Split the operation into
writing the prefix first and then copying the remaining name into the
space left in the destination buffer.

This avoids the -Wformat-truncation warnings while preserving bounded
string handling.

Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddc..72a71fd38312 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1019,6 +1019,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 	struct gbaudio_control *control, *_control;
 	size_t size;
 	char temp_name[NAME_SIZE];
+	int name_len;
 
 	ret = gbaudio_validate_kcontrol_count(w);
 	if (ret) {
@@ -1087,7 +1088,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	name_len = scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
+	strscpy(w->name + name_len, temp_name, sizeof(w->name) - name_len);
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1144,6 +1146,7 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 	struct gbaudio_control *control, *_control;
 	size_t size;
 	char temp_name[NAME_SIZE];
+	int name_len;
 
 	size = sizeof(struct snd_kcontrol_new) * module->num_controls;
 	dapm_kctls = devm_kzalloc(module->dev, size, GFP_KERNEL);
@@ -1169,8 +1172,10 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		name_len = scnprintf(curr->name, sizeof(curr->name), "GB %d ",
+				     module->dev_id);
+		strscpy(curr->name + name_len, temp_name,
+			sizeof(curr->name) - name_len);
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.55.0

