Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910079;
	b=kZm0X2ZIRf4D0JTxf0yZu5jzQEHJwrLOfqhL658hScXzpWq27gtMJuaKS2rHMKC+wVTI
	 ajNDJY84XPivzSPbWEOMG6vYfnSlpy6QwaPN1kfOgIYagqb6BtikSWlErd/IbKAwuKoum
	 LRQg+0kHRE8jdP2GWf7yyXAajl7fLMxslG70aANRsvV4itwcuo8nvgfwKSGeCBkyVpa6Z
	 ve09aSA8IUrgilvpwNqbxUOJ8ESsvhdRfXPAE1rtDwEtf2LXLA7cdO9NwMtHF+HQu5jnF
	 KPBv0Zj+nm7RrnfYGvpQkclCeLM+QXxGFraNAbMYsdxsFlDlUJHrG1KV/Rs8iQYG6vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VhzRY2mKH6ORtaSBser4RPtg8SfuX9F5vDH2pAGGfas=;
	b=GNSh9avYrex/Svet0FCJumgNNf5SFKcmZBBhbd19UA8FdbR51IaFduDqtoMyTt2ST5/G
	 C3B8VAdb1thSmlSnjLJx8DvFJ+RwGxUvec7MMbysH/L3CpKe6MJ/x9hhIZ3RY4989ZCzI
	 5ZRhytd4YxBCG26JQjIaKaX9n2vL0TbHgat8C8T+y+gyDDubhHUOo9kH+8DZsU/vieU/v
	 zFxCg1a+h5yJW/6if9BEMm6usLUhN8g0zk7XooFlfQ3UUjTvGrZvp6CJcINnFyLKOUMBm
	 Mr2Q9O3X0L4AURI5v8nTZTDsINB5aiabkx+XA8oeq0qfASdc4UOi/6doebKBt3gA5ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XuBmlLW9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746B2606A326
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 20:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XuBmlLW9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so21493305e9.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Nov 2026 12:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910078; x=1794514878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhzRY2mKH6ORtaSBser4RPtg8SfuX9F5vDH2pAGGfas=;
        b=XuBmlLW9UiXs2BXXBKrb440yEoYH303SKkcT0LYJ7DSUIiUzSHQ5An7k6RudlwkTfO
         RxJIYD11sDQxPXda+RDBdb/KNAqoF0J1pMivMhSrqdPr0PTelyAlqWlsyaHpPJWR9ugI
         62T53aqOmhOubc2YuWOM+f6pr8RrfIM2NDVgSV55+e2L1zQypwl2Ut5lLhhAFsvWNFZu
         mkjNPtI0ZZL7rEFpc03dlwXmtIMOZh72eoCD0BfMhBd/SgNSpeUJZstOwxmzbhdx+ukv
         4Cx2sAO5qe0NJz5XYwSupn6Vbm/0HpHK9zsgEqK00fs1xoe470KBNoRU7iLL8AE+69Lg
         zYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910078; x=1794514878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhzRY2mKH6ORtaSBser4RPtg8SfuX9F5vDH2pAGGfas=;
        b=PJLYiAI/kZ5lkL+oSZbk8EfONmw2gGEkN633ltiMl/JBEav9Iv9wf9YOWDMCwGTB8J
         QEaAumYq7oRX3ctYFwXduSFIhS88NWOlm8Xk4iDzAU1c09f4AeqxeVso+57Hj6VvCFeL
         KSzzur5YAXkCTxwd0atbZcmIDdCM9/1MVz5izuNQO2hLtvCCNOuMfApGa4n44j+yERwZ
         nWZlvsoczaA/uVLWuNgg3j2CzgCQ6e1NhI7MTPWuxWepjs69S9fEsPFbr6QqaSnkbAdb
         GCG829eqZ1G0lijLDmtXJja4WyIyksPRJ9yTN5QQbQM2QhvAX59102+C62HrKDo8XpzX
         2PHw==
X-Forwarded-Encrypted: i=1; AKwUvByUXkfJlV6rPQr/x6U+WnGgoRp30sp4OG6VZYWNj5T6SHfUinMEqXgoVgxMqKK2zgTk/lvy80pUiEsxZ2wn@lists.linux.dev
X-Gm-Message-State: APuU4Z+NTxBiKpo+wAjq9M/wFfNuP2pYjGm4rYtUa663Bsd1ELYQt40C
	HPpmurQ0UzkcJXAG2KDf8jcEamVe2R46SChU+5Hg//EA/RfCl6vjW5Jr
X-Gm-Gg: AYBFou0wj3FYKtacfW+ZVJiNOh4BnH4HdMvyGoDp2yJCmpTAZkqz1nck0FUIhAZkct5
	mnyZ2WYKGXT29Hr17tZ8RNbKLBcL8p0TXccOYFPcYG+w4yT7E3KwbQQ5Oyu5Q7CPCUvVIgXb41d
	Ib8urrpPVbXC1jCefCuLs5sLff7MB0+wJLwwcF+yEU84/0XVCDrLX858eJp5zZOofIdevzqy0AT
	StD4N7FI+oEtLslyQTc/xp3o7P7wGfHUBqL9PozTzAdE+gI1IxJU6YxthexqbbHiIYBQUP5Ttxi
	fqWbdOXcdT5bPyE957IidfNdnAQjRWLo7oaJgVWrbfqBUaudhgOOFxMox8JwoVVKysxH5ms+6NT
	jDotW9Ys53VaFbBLfPvnjlh0GVY1aIKuVSNyFVDttTQYoawreOtZ90ojOvrb0UjrFQcMcfuVbC3
	F6YPn49x9S+/q4oCZn9KSI9niRMVKKanu44cWxyn0y7p9dMsocKSJNiMELzRFSv1dMPC3tUQ+R+
	fgyRRncCNk/9JRDokHSY74MyIRyQ8LDicr4ggZBbd41coHjiTLGCDpWEzyUzozofg6pUKCP4iTv
	aXCaUmsaE/3uiiD81UgzSVxEi+Up671+tLSs9+RXnYShf7FD/hE=
X-Received: by 2002:a05:600c:4443:b0:4b6:b2cf:3088 with SMTP id 5b1f17b1804b1-4b6ddcf59abmr4348165e9.14.1793910077589;
        Thu, 05 Nov 2026 12:21:17 -0800 (PST)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b413312a4fsm71869865e9.1.2026.11.05.12.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:21:17 -0800 (PST)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: albu.victor.m@gmail.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	parthiban.veerasooran@microchip.com
Subject: [PATCH v2] staging: most: dim2: add missing Return: documentation
Date: Thu,  5 Nov 2026 22:21:10 +0200
Message-ID: <20261105202110.1081296-1-albu.victor.m@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104205108.1041666-1-albu.victor.m@gmail.com>
References: <20261104205108.1041666-1-albu.victor.m@gmail.com>
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

Add missing Return: descriptions to functions in dim2.c.

Signed-off-by: Albu Victor-Marian <albu.victor.m@gmail.com>
---
Changes in v2:
	* Simplified the Return: descriptions

	modified:   drivers/staging/most/dim2/dim2.c
---
 drivers/staging/most/dim2/dim2.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 0e2512d166329..34c0eb796c291 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -156,6 +156,8 @@ void dimcb_on_error(u8 error_id, const char *error_message)
  * @hdm_ch: channel specific data
  *
  * Transfer a buffer from pending_list if the channel is ready
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 {
@@ -211,6 +213,8 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
  * @data: private data
  *
  * Wait for network status and deliver it to mostcore once it is received
+ *
+ * Return: 0 when the thread stops without error.
  */
 static int deliver_netinfo_thread(void *data)
 {
@@ -392,6 +396,9 @@ static irqreturn_t dim2_task_irq(int irq, void *_dev)
  *
  * Acknowledge the interrupt and service each initialized channel,
  * if needed, in task context.
+ *
+ * Return: IRQ_WAKE_THREAD after acknowledging the interrupt and
+ * servicing each initialized channel.
  */
 static irqreturn_t dim2_ahb_isr(int irq, void *_dev)
 {
@@ -442,7 +449,9 @@ static void complete_all_mbos(struct list_head *head)
  * @ccfg: structure that holds the configuration information
  *
  * Receives configuration information from mostcore and initialize
- * the corresponding channel. Return 0 on success, negative on failure.
+ * the corresponding channel.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int configure_channel(struct most_interface *most_iface, int ch_idx,
 			     struct most_channel_config *ccfg)
@@ -561,7 +570,9 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
  * @mbo: pointer to the buffer object
  *
  * Push the buffer into pending_list and try to transfer one buffer from
- * pending_list. Return 0 on success, negative on failure.
+ * pending_list.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int enqueue(struct most_interface *most_iface, int ch_idx,
 		   struct mbo *mbo)
@@ -637,7 +648,9 @@ static void request_netinfo(struct most_interface *most_iface, int ch_idx,
  * @ch_idx: corresponding channel ID
  *
  * Destroy a channel and complete all the buffers in both started_list &
- * pending_list. Return 0 on success, negative on failure.
+ * pending_list.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int poison_channel(struct most_interface *most_iface, int ch_idx)
 {
@@ -710,6 +723,8 @@ static struct {
  *
  * By success stores one of the CLK_{NUMBER}FS in the *val and returns 0,
  * otherwise returns -EINVAL.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int get_dim2_clk_speed(const char *clock_speed, u8 *val)
 {
@@ -746,7 +761,8 @@ static void dim2_release(struct device *d)
  * @pdev: platform device structure
  *
  * Register the dim2 interface with mostcore and initialize it.
- * Return 0 on success, negative on failure.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int dim2_probe(struct platform_device *pdev)
 {
-- 
2.43.0

