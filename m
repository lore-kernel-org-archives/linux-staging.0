Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A06233927
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987148; cv=none; b=hxDauwje7zXP80GxLwj9t8U3xxQqMJF0V1lIKuwhCYnJYw3tDtbNIsWaubNsmNAYnhg4BaGK4tX4SA7k/TGKlq0YJzbYluxbFz++loBZEum20FrrqLZ8SPpRPGI5RROOV4YzkxeADj8SKvKrQprRT3MUwraigA6zk5F8ZAelPsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987148; c=relaxed/simple;
	bh=hHOoAOyr58pD6yjUaagG4HUCyBt6wqIztIixIPpSEhU=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=S5eMRWxYNIvsMDSiyHjtBt8Dg1WlmDJuLg2gUp8Z2ewZX1XLKWg4/NArgM1pGjrGSzh19ba6Yfqz+Nk+hq5mb43jyUqVvCOEsCT1GHlgyZo0w9xprvCygkCtQ5EppHhcP7C3khhE+xADVAqKSh39gjfGGFey8ZRKfs88VOMRoTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe+4U0i0; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pe+4U0i0"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso262524a91.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784987146; x=1785591946; darn=lists.linux.dev;
        h=subject:cc:to:from:mime-version:content-type:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7qAgiFMuoI0XsywesYmI6lnB3+V01C+1D3bPuEhQJo=;
        b=pe+4U0i0p1uiUpDfF1Pwrxd5vzo+eEaPeWnN4ocnNmDiBeoVIZ1oqzGBBx3sUKZ/P8
         sfYwLO/5rE3CweRiqtc1KbyYZBwzdQaloICvg/c1AKfMcEqEkR9+ep6clUd4MHzi3eUQ
         g8RP4CA475Rfe3U6PHLwfAEKlDrbYHSs056Fgsq0y8hqeQ50AFIPxegQIbI8LUhFlJEB
         cJKIbIVuxWBhkPSV1AjYEiGuBCV5yP0cOulxZqPKocjsR2iUlqSh4cWuTtNquFlSsEqI
         jQN4DNjTAAOvrwIkdbolUZFfmeZSz9Ez+Y8rJQOT6ugTEqYm2IMCDEGrwT25sSmCqQmk
         dgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784987146; x=1785591946;
        h=subject:cc:to:from:mime-version:content-type:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h7qAgiFMuoI0XsywesYmI6lnB3+V01C+1D3bPuEhQJo=;
        b=g441ZonIZnUEQ6NuYREir2jhfA/7cQX2GBwgx44UXNthxP+8of3PcGBSODf8kPlnaC
         jIWNKkFZlso5MqODo3ZWZF1OW3ATm4dRcaEqJxF54dikxfAg28yj3SX4D3sdZbLUkBcG
         QktqgmFZJ3+tXc7i1ZD2CdrR1k2TeJZ+GAWAFiGmF70CTv0/lyG2qR5mxjGgO/+Upn0g
         cpHJ219xZin4A/ls22NYAuXnyEHDaEsuBRKJdCuAR0DcU9XkwEWdBZsjy0ecSupyA8xX
         g7tRjBLaD7Jt8gUQc5Dc6zNoD48iEgtPk+wP5wVL52qpkPqoOE7zorEueThZsCD+cTCY
         DkmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0uD65x79I8FmZdJ6rMaVMDibo2u4xdVgnAeRdJRcwoIvpw6x65Fv7/RoQyclnjubV/ASii1KNKQLD0qwG@lists.linux.dev
X-Gm-Message-State: AOJu0YwVQuq3FLxgcpA5bhKGebZnTb8wCHnbfa52xlx56DLGHAm3Z7CF
	W1f8Kn6r4BOq2asEnH+1yG2XvLUoFOM0PMdMyMKdhsfpTSOUL0PuPG6b
X-Gm-Gg: AR+sD12CtIgMHFtxMzaelXWfDJXMC2tuS9ab2okO8PKFuNxgpjT6726toDyo3l3Y3FN
	R5FU3hKUP2VJGiJJbBdagM+Cb6IWz2semftvoOcIsTBkALZxUy8sTW0Lx9NRke6os25SzhKBHoL
	EKJGJ4JGAUk3uAraDnCJRvOmb9duHT53FJR/wNlv8ymYnfMfRzlhEgOZVuqFoG0Z4pgxV0Eu9uW
	TXQoB02CLaZJR5ZbelSlW9EwZsUUeQusUStCsB9naUc197qQ4f2agXjhjzssdoMeID2SPgobMBT
	hxgkRqPWoaKea6BBN3JHU5xEfF6k34pIafI+cX4IyMCXVcQTqu66Kb1VCvzrgf+yqn3NncxnC62
	8KMujwKHUvZ698GFSvRObbiS7A9heoC1olqJdTuwkX9rMa2VfUvynORMOpF4+TfxHveiHfdspxJ
	PCU7s4V1junxtM0g==
X-Received: by 2002:a17:903:468d:b0:2c9:99be:f011 with SMTP id d9443c01a7336-2cfde8941b5mr17817335ad.6.1784987146082;
        Sat, 25 Jul 2026 06:45:46 -0700 (PDT)
Received: from Potato.localdomain ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm10588029eec.26.2026.07.25.06.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 06:45:45 -0700 (PDT)
Message-ID: <6a64be09.c4d3d80a.348a49.42e7@mx.google.com>
Date: Sat, 25 Jul 2026 06:45:45 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============7220607961872909415=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shivesh <chanelshivesh@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, gregkh@linuxfoundation.org
Cc: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] greybus: audio_manager: fix sysfs_emit newline and const warnings

--===============7220607961872909415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From 5e0bcb4920bcb9e0ef6c03a91730fe45f643f3a4 Mon Sep 17 00:00:00 2001
From: Shivesh <shivesh@example.com>
Date: Sat, 25 Jul 2026 13:44:36 +0000
Subject: [PATCH] greybus: audio_manager: fix sysfs_emit newline and const
 warnings

Add terminating newlines to sysfs_emit() format strings as required
by the kernel sysfs convention. Also make envp[] array const to fix
checkpatch warning about char* array declaration.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
Signed-off-by: Shivesh <shivesh@example.com>
---
 drivers/staging/greybus/audio_manager_module.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..74ea495e1c19 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -158,7 +158,7 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	char ip_devices_string[64];
 	char op_devices_string[64];
 
-	char *envp[] = {
+	const char *const envp[] = {
 		name_string,
 		vid_string,
 		pid_string,
-- 
2.53.0


--===============7220607961872909415==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-greybus-audio_manager-fix-sysfs_emit-newline-and-con.patch"

RnJvbSA1ZTBiY2I0OTIwYmNiOWUwZWY2YzAzYTkxNzMwZmU0NWY2NDNmM2E0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl2ZXNoIDxzaGl2ZXNoQGV4YW1wbGUuY29tPgpEYXRlOiBT
YXQsIDI1IEp1bCAyMDI2IDEzOjQ0OjM2ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gZ3JleWJ1czog
YXVkaW9fbWFuYWdlcjogZml4IHN5c2ZzX2VtaXQgbmV3bGluZSBhbmQgY29uc3QKIHdhcm5pbmdz
CgpBZGQgdGVybWluYXRpbmcgbmV3bGluZXMgdG8gc3lzZnNfZW1pdCgpIGZvcm1hdCBzdHJpbmdz
IGFzIHJlcXVpcmVkCmJ5IHRoZSBrZXJuZWwgc3lzZnMgY29udmVudGlvbi4gQWxzbyBtYWtlIGVu
dnBbXSBhcnJheSBjb25zdCB0byBmaXgKY2hlY2twYXRjaCB3YXJuaW5nIGFib3V0IGNoYXIqIGFy
cmF5IGRlY2xhcmF0aW9uLgoKU2lnbmVkLW9mZi1ieTogU2hpdmVzaCA8Y2hhbmVsc2hpdmVzaEBn
bWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFNoaXZlc2ggPHNoaXZlc2hAZXhhbXBsZS5jb20+Ci0t
LQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlcl9tb2R1bGUuYyB8IDE0ICsr
KysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX21hbmFnZXJf
bW9kdWxlLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5j
CmluZGV4IGRjOTBjYzJkMjMwOC4uNzRlYTQ5NWUxYzE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX21vZHVsZS5jCisrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2F1ZGlvX21hbmFnZXJfbW9kdWxlLmMKQEAgLTc1LDcgKzc1LDcgQEAgc3RhdGlj
IHZvaWQgZ2JfYXVkaW9fbW9kdWxlX3JlbGVhc2Uoc3RydWN0IGtvYmplY3QgKmtvYmopCiBzdGF0
aWMgc3NpemVfdCBnYl9hdWRpb19tb2R1bGVfbmFtZV9zaG93KHN0cnVjdCBnYl9hdWRpb19tYW5h
Z2VyX21vZHVsZSAqbW9kdWxlLAogCQkJCQkgc3RydWN0IGdiX2F1ZGlvX21hbmFnZXJfbW9kdWxl
X2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQogewotCXJldHVybiBzeXNmc19lbWl0KGJ1Ziwg
IiVzIiwgbW9kdWxlLT5kZXNjLm5hbWUpOworCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVzXG4i
LCBtb2R1bGUtPmRlc2MubmFtZSk7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgZ2JfYXVkaW9fbWFuYWdl
cl9tb2R1bGVfYXR0cmlidXRlIGdiX2F1ZGlvX21vZHVsZV9uYW1lX2F0dHJpYnV0ZSA9CkBAIC04
NCw3ICs4NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZ2JfYXVkaW9fbWFuYWdlcl9tb2R1bGVfYXR0cmli
dXRlIGdiX2F1ZGlvX21vZHVsZV9uYW1lX2F0dHJpYnV0ZSA9CiBzdGF0aWMgc3NpemVfdCBnYl9h
dWRpb19tb2R1bGVfdmlkX3Nob3coc3RydWN0IGdiX2F1ZGlvX21hbmFnZXJfbW9kdWxlICptb2R1
bGUsCiAJCQkJCXN0cnVjdCBnYl9hdWRpb19tYW5hZ2VyX21vZHVsZV9hdHRyaWJ1dGUgKmF0dHIs
IGNoYXIgKmJ1ZikKIHsKLQlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIlZCIsIG1vZHVsZS0+ZGVz
Yy52aWQpOworCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVkXG4iLCBtb2R1bGUtPmRlc2Mudmlk
KTsKIH0KIAogc3RhdGljIHN0cnVjdCBnYl9hdWRpb19tYW5hZ2VyX21vZHVsZV9hdHRyaWJ1dGUg
Z2JfYXVkaW9fbW9kdWxlX3ZpZF9hdHRyaWJ1dGUgPQpAQCAtOTMsNyArOTMsNyBAQCBzdGF0aWMg
c3RydWN0IGdiX2F1ZGlvX21hbmFnZXJfbW9kdWxlX2F0dHJpYnV0ZSBnYl9hdWRpb19tb2R1bGVf
dmlkX2F0dHJpYnV0ZSA9CiBzdGF0aWMgc3NpemVfdCBnYl9hdWRpb19tb2R1bGVfcGlkX3Nob3co
c3RydWN0IGdiX2F1ZGlvX21hbmFnZXJfbW9kdWxlICptb2R1bGUsCiAJCQkJCXN0cnVjdCBnYl9h
dWRpb19tYW5hZ2VyX21vZHVsZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKIHsKLQlyZXR1
cm4gc3lzZnNfZW1pdChidWYsICIlZCIsIG1vZHVsZS0+ZGVzYy5waWQpOworCXJldHVybiBzeXNm
c19lbWl0KGJ1ZiwgIiVkXG4iLCBtb2R1bGUtPmRlc2MucGlkKTsKIH0KIAogc3RhdGljIHN0cnVj
dCBnYl9hdWRpb19tYW5hZ2VyX21vZHVsZV9hdHRyaWJ1dGUgZ2JfYXVkaW9fbW9kdWxlX3BpZF9h
dHRyaWJ1dGUgPQpAQCAtMTAzLDcgKzEwMyw3IEBAIHN0YXRpYyBzc2l6ZV90IGdiX2F1ZGlvX21v
ZHVsZV9pbnRmX2lkX3Nob3coc3RydWN0IGdiX2F1ZGlvX21hbmFnZXJfbW9kdWxlICptb2R1CiAJ
CQkJCSAgICBzdHJ1Y3QgZ2JfYXVkaW9fbWFuYWdlcl9tb2R1bGVfYXR0cmlidXRlICphdHRyLAog
CQkJCQkgICAgY2hhciAqYnVmKQogewotCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVkIiwgbW9k
dWxlLT5kZXNjLmludGZfaWQpOworCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVkXG4iLCBtb2R1
bGUtPmRlc2MuaW50Zl9pZCk7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgZ2JfYXVkaW9fbWFuYWdlcl9t
b2R1bGVfYXR0cmlidXRlCkBAIC0xMTQsNyArMTE0LDcgQEAgc3RhdGljIHNzaXplX3QgZ2JfYXVk
aW9fbW9kdWxlX2lwX2RldmljZXNfc2hvdyhzdHJ1Y3QgZ2JfYXVkaW9fbWFuYWdlcl9tb2R1bGUg
Km0KIAkJCQkJICAgICAgIHN0cnVjdCBnYl9hdWRpb19tYW5hZ2VyX21vZHVsZV9hdHRyaWJ1dGUg
KmF0dHIsCiAJCQkJCSAgICAgICBjaGFyICpidWYpCiB7Ci0JcmV0dXJuIHN5c2ZzX2VtaXQoYnVm
LCAiMHglWCIsIG1vZHVsZS0+ZGVzYy5pcF9kZXZpY2VzKTsKKwlyZXR1cm4gc3lzZnNfZW1pdChi
dWYsICIweCVYXG4iLCBtb2R1bGUtPmRlc2MuaXBfZGV2aWNlcyk7CiB9CiAKIHN0YXRpYyBzdHJ1
Y3QgZ2JfYXVkaW9fbWFuYWdlcl9tb2R1bGVfYXR0cmlidXRlCkBAIC0xMjUsNyArMTI1LDcgQEAg
c3RhdGljIHNzaXplX3QgZ2JfYXVkaW9fbW9kdWxlX29wX2RldmljZXNfc2hvdyhzdHJ1Y3QgZ2Jf
YXVkaW9fbWFuYWdlcl9tb2R1bGUgKm0KIAkJCQkJICAgICAgIHN0cnVjdCBnYl9hdWRpb19tYW5h
Z2VyX21vZHVsZV9hdHRyaWJ1dGUgKmF0dHIsCiAJCQkJCSAgICAgICBjaGFyICpidWYpCiB7Ci0J
cmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiMHglWCIsIG1vZHVsZS0+ZGVzYy5vcF9kZXZpY2VzKTsK
KwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIweCVYXG4iLCBtb2R1bGUtPmRlc2Mub3BfZGV2aWNl
cyk7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgZ2JfYXVkaW9fbWFuYWdlcl9tb2R1bGVfYXR0cmlidXRl
CkBAIC0xNTgsNyArMTU4LDcgQEAgc3RhdGljIHZvaWQgc2VuZF9hZGRfdWV2ZW50KHN0cnVjdCBn
Yl9hdWRpb19tYW5hZ2VyX21vZHVsZSAqbW9kdWxlKQogCWNoYXIgaXBfZGV2aWNlc19zdHJpbmdb
NjRdOwogCWNoYXIgb3BfZGV2aWNlc19zdHJpbmdbNjRdOwogCi0JY2hhciAqZW52cFtdID0gewor
CWNvbnN0IGNoYXIgKmNvbnN0IGVudnBbXSA9IHsKIAkJbmFtZV9zdHJpbmcsCiAJCXZpZF9zdHJp
bmcsCiAJCXBpZF9zdHJpbmcsCi0tIAoyLjUzLjAKCg==

--===============7220607961872909415==--
